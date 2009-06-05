require 'digest/sha1'
class User < ActiveRecord::Base
  acts_as_ferret :fields => [:first_name, :last_name]

# Paperclip
  has_attached_file :profile_picture,
    :styles => {
      :thumb=> "200x200#",
      :small_thumb=> "100x100#",
      :small  => "150x150>" }

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  has_many :initiated_relationships, :foreign_key => :first_user_id, :class_name => "Relationship"
  has_many :received_relationships, :foreign_key => :second_user_id, :class_name => "Relationship"

  has_many :statuses

  validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..20
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  validates_presence_of :first_name
  validates_presence_of :last_name
  before_save :encrypt_password

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end


  def status=(new_status)
    s = Status.create(:status=>new_status)
    statuses << s
    s.save
  end

  def status
    if statuses.size == 0
      return ""
    end

    statuses.sort_by{|s| s.created_at}.last.status
  end

  def possessive_identifier(user)
    if self == user
      "My"
    else
      first_name + "'s"
    end
  end

  def relationships
    initiated_relationships + received_relationships
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    self.remember_token_expires_at = 2.weeks.from_now.utc
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  ########### General Methods (Not authentication related) ######################
 
  def full_name
    first_name.to_s + " " + last_name.to_s
  end

  def name
    full_name
  end
  
  def to_s
    full_name
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
    
    def password_required?
      crypted_password.blank? || !password.blank?
    end
end
