class Detail < ApplicationRecord
  belongs_to :product
  mount_uploader :image, ImagesUploader

  # validates :product_id, :title, :image, :text, presence: true

end
