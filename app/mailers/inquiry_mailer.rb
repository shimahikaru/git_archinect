class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.inquiry_email.subject
  #
  # def inquiry_email
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end
  def inquiry_email(inquiry)
    @inquiry = inquiry
    mail(to: 'to@example.com', subject: '新規お問い合わせがあります')
  end

end
