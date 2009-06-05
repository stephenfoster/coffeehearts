class Relationship < ActiveRecord::Base
  belongs_to :first_user, :foreign_key=>:first_user_id, :class_name => "User"
  belongs_to :second_user, :foreign_key=>:second_user_id, :class_name => "User"
  
  has_many :pictures

  validates_presence_of :name

  def main_picture
    pictures.last.image
  end
  
  def other(user)
    return first_user if second_user == user
    return second_user if first_user == user

    nil
  end
end
