class User < ActiveRecord::Base
  after_create :send_welcome_email
  after_create :register_user_to_mailchimp_list

  def name
    email
  end

  # def new
  #   @user = User.new(params)
  # end

  # def create
  #   @user = User.new(:email)

  #   if @user.save
  #     UserMailer.welcome(@user).deliver_now
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def register_user_to_mailchimp_list
    SubscribeToNewsletter.new.run(self.email)
  end

end
