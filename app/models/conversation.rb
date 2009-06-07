class Conversation < ActiveRecord::Base
  belongs_to :relationship
  belongs_to :user

  #Stuff you can post to a conversation
  has_many :pictures
  has_many :text_blocks
  has_many :blog_links

  def communications
    (pictures + text_blocks + blog_links).sort_by{|c| c.created_at}.reverse
  end

  def last_post
    communications.first
  end

  def updated
    return last_post.updated_at if last_post

    updated_at
  end

  def main_picture
    pictures.last.image
  end

  # Eventually check if the conversation has been "seen"
  # not just updated since the last logout.
  def status_for(user)
    return "NEW!" if user.last_logout.nil?


    if created_at > user.last_logout
       "NEW!"
    elsif updated > user.last_logout
       "UPDATED!"
    else
       ""
    end
  end
end
