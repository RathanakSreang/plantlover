class Plant < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
end
