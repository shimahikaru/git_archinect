class NoticesController < ApplicationController

  def index
  end

  def show
  end

  def new
  @notice = Notice.new
  @user = User.find(current_user.id)
  @notice.user = @user
  end

  def create
  end

  def edit
  end

  def update
  end

end
