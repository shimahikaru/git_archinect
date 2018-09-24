class ProductsController < ApplicationController

 def index
  @products = Product.where(location: params[:key_word])
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
    redirect_to user_path(current_user) and return
    else
      @product = Product.new(create_params)
      @user = User.find(current_user.id)
      render action: :new
    end
  end

  def edit
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.whole_photos.select(:id, :photo)
    genre = GenreTag.find_by(product_id: @product.id)
    @genre = genre.genretag
    @products = Product.where(location: @product.location)
  end




  private

  def create_params
    params.require(:product).permit(:title, :subtitle, :whet, :completion, :location, :area, :text, :genre, { :genre_ids=> [] }, details_attributes:[:image, :title, :text, :image_cache ], whole_photos_attributes:[:photo, :photo_cache] ).merge(user_id: current_user.id)
  end

end
