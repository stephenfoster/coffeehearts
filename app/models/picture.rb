class Picture < ActiveRecord::Base
  belongs_to :relationship
  belongs_to :user

# Paperclip
  has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }

end
