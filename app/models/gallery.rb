class Gallery < ApplicationRecord
  belongs_to :user

  mount_uploader :photo, ImageUploader
end
