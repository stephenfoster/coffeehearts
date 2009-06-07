class Relationship < ActiveRecord::Base
  has_many :perspectives

  has_many :users, :through=>:perspectives
 
  has_many :conversations, :order=>"created_at DESC"

  validates_presence_of :name

  def main_picture
    pictures.last.image
  end
  
  def other(user)
    return first_user if second_user == user
    return second_user if first_user == user

    nil
  end

  def first_user
    users.first
  end

  def second_user
    users.second
  end

  def name_for(user)
    perspective_for(user).name
  end

  def perspective_for(user)
    perspectives.select{|p| p.user == user}.first
  end

  def perspective_for_first_user
    perspectives.first
  end

  def perspective_for_second_user
    perspectives.second
  end

  def status_message_for(user)
    message_about(last_update, user)
  end

  def last_update
    all_content.sort_by{|c| c.updated_at}.last
  end
   
  def message_about(thing, user)

    if user.last_logout and thing.updated_at < user.last_logout
      return "nothing new"
    end

    if thing.class == Picture
      owner_of(thing) + " added a new pic!"
    elsif thing.class == Perspective
      owner_of(thing) + " changed his/her perspective"
    else
      raise "Need to make a message for " + thing.class.to_s
    end
  end 

  def owner_of(thing)
    return thing.user.login if thing.user
     
    "someone"
  end

  #Will be inefficient.  Refactor.
  def all_content
    pictures + perspectives
  end

  def combined_perspective
    perspectives.collect{|p| p.name}.join(" / ")
  end

  def combined_user_names
    users.collect{|u| u.login}.join(" and ")
  end

  def pictures
    conversations.collect{|c| c.pictures}.flatten
  end
end
