class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def email_user(user)
    @user = user
    mail(to: @user.email, subject: 'お問い合わせ')
    end
  end

end
