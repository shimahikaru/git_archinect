class TopController < ApplicationController
  def index
    @products = Product.select(:id, :title, :location, :category, :completion)
    @photos = WholePhoto.group(:product_id)
  end

  def about
  end

  def search
    @products = Product.all
    @products = @products.where(location: params[:search_location]) if params[:search_location]
    @photos = WholePhoto.group(:product_id)
  end

  # def search
  #   @products = Product.select(:id, :title, :location, :category, :completion).search(params[:search])
  #   @photos = WholePhoto.group(:product_id)
  # end

end
