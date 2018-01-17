class Gallery < ApplicationRecord
  belongs_to :user
  # validates_presence_of :photo
  mount_uploader :photo, ImageUploader
end
