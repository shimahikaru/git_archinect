class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
    @tags = @user.user_works
  end

  def edit
    @user = User.find(current_user.id)
    @user.avatar.cache! unless @user.avatar.blank?
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
  params.require(:user).permit(:familyname, :firstname, :email, :location, :office, :phone, :address, :local, :url, :avatar, :offer, :text, :avatar_cache, { :work_ids=> [] })
end



end
