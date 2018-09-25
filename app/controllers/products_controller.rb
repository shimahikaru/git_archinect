class ProductsController < ApplicationController

 def index
  @products = Product.select(:id, :location, :category, :completion)

 end

   def show
    @product = Product.find(params[:id])
    @photos = @product.whole_photos.select(:id, :photo)
    @tags = @product.genre_products
    @details = @product.details
  end

 def search
  productgenre = GenreProduct.where(genre_id: params[:key_word]).select(:product_id)
  @products = Product.where(location: params[:key_word]).or( Product.where(category: params[:key_word]) ).or( Product.where(id: productgenre) )
 end

  def new
  @product = Product.new
  @user = User.find(current_user.id)
  2.times { @product.details.build }
  4.times { @product.whole_photos.build }
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
  end

  private

  def create_params
    params.require(:product).permit(:title, :subtitle, :whet, :completion, :location, :area, :text, :category, { :genre_ids=> [] }, details_attributes:[:image, :title, :text, :image_cache ], whole_photos_attributes:[:photo, :photo_cache] ).merge(user_id: current_user.id)
  end

end
