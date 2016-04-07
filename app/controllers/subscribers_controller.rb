class SubscribersController < ApplicationController
  def create
    SubscribeToNewsletterService.new(params[:email]).call
    flash[:notice] = "Successfully subscribed to newsletter"
    respond_to do |format|
          format.html{ redirect_to root_path }
          format.js
    end
  rescue Gibbon::MailChimpError
    respond_to do |format|
          format.html{ redirect_to root_path }
          format.js
    end
  end
end
