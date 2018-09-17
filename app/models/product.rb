class Product < ApplicationRecord
  belongs_to :user
  has_many :whole_photos
  accepts_nested_attributes_for :whole_photos, allow_destroy: true
  has_many :details
  accepts_nested_attributes_for :details, allow_destroy: true
  has_one :genre_tag
  accepts_nested_attributes_for :genre_tag, allow_destroy: true
end
