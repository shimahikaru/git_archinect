class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update, ]

  def index
    @users = User.where(offer: "0").order("id DESC").page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @tags = @user.user_works
    @products = Product.where(user_id: @user.id).select(:id, :title, :location, :category, :completion).limit(10)
    @photos = WholePhoto.group(:product_id)
    @notice = @user.notice
    @commented = @user.commented_products.distinct.limit(10)
  end

  def search
    @users = User.select(:id, :familyname, :firstname, :location, :avatar, :text,).order("id DESC")
    @users = @users.where(offer: "0")
    @users = @users.count_order(params[:count]) if params[:count].present?
    userworks = UserWork.where(work_id: params[:work_id]).select(:user_id) if params[:work_id].present?
    @users = @users.where(id: userworks) if userworks.present?
    # end
    @users = @users.where(location: params[:location]) if params[:location].present?
    @users = @users.page(params[:page]).per(25)
  end

  def about
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

  def followings
    user = User.find(params[:id])
    @users = user.followings

  end

  def followers
    user = User.find(params[:id])
    @users = user.followers

  end

private

def update_params
  params.require(:user).permit(:familyname, :firstname, :email, :location, :office, :phone, :address, :local, :url, :avatar, :offer, :text, :avatar_cache,:remove_avatar, { :work_ids=> [] })
end



end
