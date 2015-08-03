class UserMailer < ActionMailer::Base
  default from: "rosebookbuysellnotifications@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rose Book Buy Sell')
  end

  def send_offer(offer)
  	@offer = offer
  	@user = offer.listing.user
  	mail(to: @user.email, subject: 'Your Listing Recieved an Offer!')
  end


end
