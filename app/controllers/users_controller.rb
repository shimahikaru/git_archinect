class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    work = TagWork.find_by(user_id: current_user.id)
    @works = work.work_tag
  end

  def edit
    @user = User.find(current_user.id)
    @user.avatar.cache! unless @user.avatar.blank?
    @user.tag_works.build unless @user.tag_works.exists?
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
  params.require(:user).permit(:phone, :address, :local, :url, :avatar, :offer, :text, tag_works_attributes:[:work1, :work2, :work3,:work4, :work5, :work6, :work7, :work8, :work9, :work10, :work11, :_destroy, :id])
end



end
