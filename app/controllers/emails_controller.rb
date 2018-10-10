class EmailsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @email = Email.new
    render :action => 'index'
  end

  def confirm
    @email = Email.new(email_params)
    @user = User.find(params[:user_id])
    if @email.valid?
     render :action => 'confirm'
    else
     render :action => 'index'
    end
  end

  def complete
    @email = Email.new(email_params)
    @user = User.find(params[:user_id])
    @usermail = @user.address
    EmailMailer.email_user(@usermail, @email).deliver_now
  end

  private
  def email_params
    params.require(:email).permit(:name, :addr, :message)
  end
end
