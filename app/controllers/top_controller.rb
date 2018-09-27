class TopController < ApplicationController
  def index
  @products = Product.select(:id, :location, :category, :completion)
  @photos = WholePhoto.group(:product_id)
  end
end
