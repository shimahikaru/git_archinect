class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tags = @user.user_works
    @products = Product.where(user_id: @user.id).select(:id, :title, :location, :category, :completion)
    @photos = WholePhoto.group(:product_id)
  end

  def search
  end

  def edit
    @user = User.find(current_user.id)
    # @user.avatar.cache! unless @user.avatar.blank?
  end

  def update
    user = User.find(current_user.id)
    if user.update(update_params)
      redirect_to user_path(current_user)
    else
      @user = User.find(current_user.id)
      render action: :edit
    end
  end

private

def update_params
  params.require(:user).permit(:familyname, :firstname, :email, :location, :office, :phone, :address, :local, :url, :avatar, :offer, :text, :avatar_cache,:remove_avatar, { :work_ids=> [] })
end



end
