class WholePhoto < ApplicationRecord
  belongs_to :product
  mount_uploader :photo, PhotosUploader

    # validates :product_id, :photo, presence: true

end
