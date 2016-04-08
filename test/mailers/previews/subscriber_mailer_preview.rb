class SubscriberMailerPreview < ActionMailer::Preview
  def welcome
    email = email
    SubscriberMailer.welcome(email)
  end
end

