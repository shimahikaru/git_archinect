class ProductsController < ApplicationController

 def index
  @products = Product.select(:id, :location, :category, :completion)
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
  @products = Product.where(location: params[:key_word]).or( Product.where(category: params[:key_word]) ).or( Product.where(id: productgenre) )
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
     # details = Detail.new(create_detail_params)
     # whole_photos = WholePhoto.new(create_whole_photo_params)

     # @product.details << details


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
    params.require(:product).permit(:title, :subtitle, :whet, :completion, :location, :area, :text, :category, { :genre_ids=> [] }, details_attributes:[:id, :image, :title, :text, :image_cache, :_destroy ], whole_photos_attributes:[:id, :photo, :photo_cache, :_destroy] ).merge(user_id: current_user.id)
  end

  # def create_detail_params

  # end

  # def create_whole_photo_params

  # end

end
