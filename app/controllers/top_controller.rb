class TopController < ApplicationController
  def index
  @photos = WholePhoto.where('created_at > ?', 1.month.ago).group(:product_id)
  @products = Product.where('created_at > ?', 1.month.ago).select(:id, :title, :location, :category, :completion).page(params[:page]).per(20)
  end

  def about
  end



  # def search
  #   @products = Product.select(:id, :title, :location, :category, :completion).search(params[:search])
  #   @photos = WholePhoto.group(:product_id)
  # end

end
