class TopController < ApplicationController
  def index
   @products = Product.all

  end
end
