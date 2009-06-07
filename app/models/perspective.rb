class Perspective < ActiveRecord::Base
  belongs_to :user
  belongs_to :relationship

  # Paperclip
  has_attached_file :picture,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }

end
