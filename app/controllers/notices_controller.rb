class NoticesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @notice = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def new
  @notice = Notice.new
  @user = User.find(current_user.id)
  @notice.user = @user
  end

  def create
    notice = Notice.find_or_initialize_by(user_id: current_user.id)
    notice.update_attributes(create_params)
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
  end

  private

  def create_params
    params.require(:notice).permit(:category, :title, :text).merge(user_id: current_user.id)
  end

end
