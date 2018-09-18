class ProductsController < ApplicationController

  def new
  @user = User.find(current_user.id)
  @product = Product.new
  @product.build_genre_tag
  @product.details.build
  4.times { @product.whole_photos.build }
  end

  def create
     @user = User.find(current_user.id)
    if Product.create(create_params)
    redirect_to user_product_path(@user, @product)
    else
    render :new
    end
  end


  private

  def create_params
    params.require(:product).permit(:title, :whet, :completion, :location, :location2, :area, :text, whole_photos_attributes:[:photo], details_attributes:[:image, :title, :text], genre_tag_attributes:[:genre1, :genre2, :genre3, :genre4, :genre5, :genre6, :genre7, :genre8, :genre9, :genre10, :genre11]).merge(user_id: current_user.id)
  end

end
