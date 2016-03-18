class User < ActiveRecord::Base

  after_create :send_welcome_email
  after_create :register_user_to_mailchimp_list

  def name
    email
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def register_user_to_mailchimp_list
    SubscribeToNewsletter.new.run(self.email)
  end

end
