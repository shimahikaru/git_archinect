class Detail < ApplicationRecord
  belongs_to :product
  mount_uploader :image, ImagesUploader

    validates :image, :title, :text, presence: true

end
