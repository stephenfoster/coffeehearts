class Perspective < ActiveRecord::Base
  belongs_to :user
  belongs_to :relationship
end
