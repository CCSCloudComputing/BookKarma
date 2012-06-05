class UserMailer < ActionMailer::Base
  default :from => "contact@bookkarma.com"

  def welcome_email(user)
  	@user = user
  	@url = "<insert login page url here>"
  	mail(:to => user.email, :subject => "Welcome to BookKarma")
  end
end
