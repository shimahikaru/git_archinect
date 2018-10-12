class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  impressionist :actions=> [:show]

 def index
  @products = Product.select(:id, :title, :location, :category, :completion)
  @photos = WholePhoto.group(:product_id)
 end

   def show
    @product = Product.find(params[:id])
    @photos = @product.whole_photos.select(:id, :photo)
    @tags = @product.genre_products
    @details = @product.details
    @comment = Comment.new
    @comment.product_id = @product.id
  end


  def search
   @products = Product.select(:id, :title, :location, :category, :completion)
   @photos = WholePhoto.group(:product_id)
   @products = @products.count_order(params[:count]) if params[:count].present?
   @products = @products.where(location: params[:location]) if params[:location].present?
   @products = @products.where(category: params[:category]) if params[:category].present?
   productgenre = GenreProduct.where(genre_id: params[:genre_id]).select(:product_id) if params[:genre_id].present?
   @products = @products.where(id: productgenre) if productgenre.present?
   @products = @products.where(user_id: params[:user_id]) if params[:user_id].present?
  end

  def about
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
  @photos = @product.whole_photos.select(:id, :photo)
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
    params.require(:product).permit(:title, :subtitle, :charge, :whet, :completion, :location, :area, :text, :category, { :genre_ids=> [] }, details_attributes:[:id, :image, :title, :text, :image_cache, :_destroy ], whole_photos_attributes:[:id, :photo, :photo_cache, :_destroy] ).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:product).permit(:title, :subtitle, :charge, :whet, :completion, :location, :area, :text, :category, { :genre_ids=> [] }, details_attributes:[:id, :image, :title, :text, :image_cache, :_destroy ], whole_photos_attributes:[:id, :photo, :photo_cache,:_destroy] ).merge(user_id: current_user.id)
  end



  # def create_detail_params

  # end

  # def create_whole_photo_params

  # end

end
