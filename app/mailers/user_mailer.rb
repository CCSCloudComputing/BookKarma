class UserMailer < ActionMailer::Base
  default :from => "contact@bookkarma.com"

  def welcome_email(user)
  	@user = user
  	#@url = ""
  	mail(:to => user.email, :subject => "Welcome to BookKarma")
  end
end
