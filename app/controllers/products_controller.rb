class ProductsController < ApplicationController

  def new
  @user = User.find(current_user.id)
  @product = Product.new
  end

  def create
  end

end
