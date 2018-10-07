# Preview all emails at http://localhost:3000/rails/mailers/email_mailer
class EmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email_mailer/user_email
  def user_email
    EmailMailer.user_email
  end

end
