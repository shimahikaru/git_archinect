class ProductsController < ApplicationController

  def new
  @product = Product.new
  @user = User.find(current_user.id)
  @product.build_genre_tag
  @product.details.build
  4.times { @product.whole_photos.build }
  @product.user = @user
  end

  def create
     @product = Product.new(create_params)
    if @product.save
    # if @product.save(create_params)
    redirect_to user_path(current_user) and return
    else
      @product = Product.new(create_params)
      @user = User.find(current_user.id)
      render action: :new
    end
  end


  private

  def create_params
    params.require(:product).permit(:title, :subtitle, :whet, :completion, :location, :location2, :area, :text, genre_tag_attributes:[:genre1, :genre2, :genre3, :genre4, :genre5, :genre6, :genre7, :genre8, :genre9, :genre10, :genre11], details_attributes:[:image, :title, :text],whole_photos_attributes:[:photo] ).merge(user_id: current_user.id)
    # params.require(:product).permit(:title, :whet, :completion, :location, :location2, :area, :text, whole_photos_attributes:[:photo], details_attributes:[:image, :title, :text], genre_tag_attributes:[:genre1, :genre2, :genre3, :genre4, :genre5, :genre6, :genre7, :genre8, :genre9, :genre10, :genre11]).merge(user_id: current_user.id)
  end

end
