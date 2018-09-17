class WholePhoto < ApplicationRecord
  belongs_to :product
  mount_uploader :photo, PhotosUploader
end
