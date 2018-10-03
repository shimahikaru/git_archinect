class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email_user(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site') do |format|
      format.text
    end
  end

end
