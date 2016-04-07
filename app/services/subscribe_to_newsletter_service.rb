class SubscribeToNewsletterService
  def initialize(email)
    @email = email
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @list_id = ENV['MAILCHIMP_LIST_ID']
  end

  def call
    @gibbon.lists(@list_id).members.create(
      body: {
        email_address: @email,
        status: "subscribed",
        double_optin: false
        # merge_fields: {
        #   FNAME: @user.first_name,
        #   LNAME: @user.last_name
        # }
      }
    )
    SubscriberMailer.welcome(@email).deliver_now
  end
end
