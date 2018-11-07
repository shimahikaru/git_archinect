class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  impressionist :actions=> [:show]

 def index
  @photos = WholePhoto.group(:product_id)
  @products = Product.select(:id, :title, :location, :category, :completion).page(params[:page]).per(20)
 end

   def show
    @product = Product.find(params[:id])
    @photos = @product.whole_photos.select(:id, :photo)
    @tags = @product.genre_products
    @details = @product.details
    comments = Comment.all
    @comments = @product.comments
    @comment = Comment.new
    @comment.product_id = @product.id
  end


  def search
   @products = Product.select(:id, :title, :location, :category, :completion)
   @photos = WholePhoto.group(:product_id)
   @products = @products.count_order(params[:count]) if params[:count].present?
   @products = @products.where(location: params[:location]) if params[:location].present?
   @products = @products.where(category: params[:category]) if params[:category].present?
   # productgenre = GenreProduct.where(genre_id: params[:genre_id]).select(:product_id) if params[:genre_id].present?
   # @products = @products.where(id: productgenre)
   @products = @products.search_genre(params[:genres]) if params[:genres] && params[:genres].compact.reject(&:empty?).present?
   @products = @products.search_genre(params[:genre_id]) if params[:genre_id].present?
   @products = @products.where(user_id: params[:user_id]) if params[:user_id].present?
   @products = @products.page(params[:page]).per(20)
  end

  def about
  end

  def new
  @product = Product.new
  @user = User.find(current_user.id)
  @details = 5.times { @product.details.build }
  @photos = 5.times { @product.whole_photos.build }
  @product.user = @user
  end

  def create
     @product = Product.new(create_params)
    if @product.save
    else
      @photos = 5.times { @product.whole_photos.build }
      @details = 5.times { @product.details.build }
      render action: :newz
















    end
  end

def destroy
  product = Product.find(params[:id])
  product.destroy if product.user_id == current_user.id
  redirect_to user_path(current_user)
end

  def edit
  @product = Product.find(params[:id])
  @user = current_user
  @photos = @product.whole_photos.select(:id, :photo)
  ( 5 - @photos.length).times { @product.whole_photos.build }
  details = @product.details
  @details = ( 5 - details.length).times { @product.details.build }
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
    params.require(:product).permit(:title, :subtitle, :charge, :whet, :completion, :location, :area, :text, :category, { :genre_ids=> [] }, details_attributes:[:id, :image, :title, :text, :image_cache, :_destroy ], whole_photos_attributes:[:id, :photo, :photo_cache, :_destroy ] ).merge(user_id: current_user.id)
  end




  # def create_detail_params

  # end

  # def create_whole_photo_params

  # end

end
