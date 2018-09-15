class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
    @user.avatar.cache! unless @user.avatar.blank?
  end

  def update
    user = User.find(current_user.id)
    if user.update(update_params)
      redirect_to controller: 'users', action: 'show'
    else
      render :edit
    end
  end

private

def update_params
  params.require(:user).permit(:phone, :address, :local, :url, :avatar)
end



end
