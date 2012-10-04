class UserMailer < ActionMailer::Base
  default :from => "contact@bookkarma.com"

  def welcome_email(user)
  	@user = user
  	#@url = ""
  	mail(:to => user.email, :subject => "Welcome to BookKarma")
  end

  def match_found_owner(match)
  	@match = match
  	mail(:to => match.book.user.email, :subject => "We found someone who wants your book!")
  end

  def match_found_requester(match)
  	@match = match
  	mail(:to => match.request.user.email, :subject => "We found someone who has a book you own!")
  end

end
