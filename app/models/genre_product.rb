class GenreProduct < ApplicationRecord
  belongs_to :product
  belongs_to :genre

  def self.searchgenres(genres)
    self.where(genre_id: genres).select(:product_id)
  end
end
