class WholePhoto < ApplicationRecord
  belongs_to :product
  mount_uploader :photo, PhotosUploader

    validates :photo, presence: true


end
