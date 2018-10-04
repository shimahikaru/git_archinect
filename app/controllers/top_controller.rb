class TopController < ApplicationController
  def index
    @products = Product.select(:id, :title, :location, :category, :completion).order(id: "DESC")
    @photos = WholePhoto.group(:product_id)
  end

  # def search
  #   @products = Product.select(:id, :title, :location, :category, :completion).search(params[:search])
  #   @photos = WholePhoto.group(:product_id)
  # end

end
