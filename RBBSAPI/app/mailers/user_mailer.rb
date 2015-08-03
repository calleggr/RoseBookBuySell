class UserMailer < ActionMailer::Base
  default from: "rosebookbuysellnotifications@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rose Book Buy Sell')
  end

end
