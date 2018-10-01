class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

 def index
  @products = Product.select(:id, :title, :location, :category, :completion)
  @photos = WholePhoto.group(:product_id)
 end

   def show
    @product = Product.find(params[:id])
    @photos = @product.whole_photos.select(:id, :photo)
    @tags = @product.genre_products
    @details = @product.details
  end

 def search
  productgenre = GenreProduct.where(genre_id: params[:key_word]).select(:product_id)
  @products = Product.where(location: params[:key_word]).or( Product.where(category: params[:key_word]) ).or( Product.where(id: productgenre) ).or( Product.where(user_id: params[:user_id]) )
  @photos = WholePhoto.group(:product_id)
 end

  def new
  @product = Product.new
  @user = User.find(current_user.id)
  @product.details.build
  @product.whole_photos.build
  @product.user = @user
  end

  def create
     @product = Product.new(create_params)

    if @product.save
    redirect_to user_path(current_user)
    else
      render action: :new
    end
  end

  def edit
  @product = Product.find(params[:id])
   @user = current_user
     # @product.whole_photos.photo.cache! unless @product.whole_photos.photo.blank?
     #   @product.details.image.cache! unless @product.details.image.blank?
  end

  def update
    @product = Product.find(params[:id])
   if user_signed_in? && current_user == @product.user
     if @product.update(update_params)
     redirect_to user_path(current_user)
     else
     render action: :edit
     end
   end
  end

  private

  def create_params
    params.require(:product).permit(:title, :subtitle, :whet, :completion, :location, :area, :text, :category, { :genre_ids=> [] }, details_attributes:[:id, :image, :title, :text, :image_cache, :_destroy ], whole_photos_attributes:[:id, :photo, :photo_cache, :_destroy] ).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:product).permit(:title, :subtitle, :whet, :completion, :location, :area, :text, :category, { :genre_ids=> [] }, details_attributes:[:id, :image, :title, :text, :image_cache, :_destroy ], whole_photos_attributes:[:id, :photo, :photo_cache, :_destroy] ).merge(user_id: current_user.id)
  end



  # def create_detail_params

  # end

  # def create_whole_photo_params

  # end

end
