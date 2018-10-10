class EmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_mailer.user_email.subject
  #

  def email_user(usermail, email)
    @email = email
    @usermail = usermail
    mail to: usermail, subject: 'メッセージを受信しました。'
  end

end
