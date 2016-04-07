class SubscriberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(email)
    @email  = email
    @greeting = "Hi"

    mail to: @email, subject: "Welcome on Flykke!"
  end
end
