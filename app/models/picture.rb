class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

# Paperclip
  has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }

  def relationship
    conversation.relationship
  end

end
