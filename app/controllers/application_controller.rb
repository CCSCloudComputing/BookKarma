class ApplicationController < ActionController::Base
  protect_from_forgery


 def current_user
 	@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
 end

 def signed_in?
    return !current_user.nil?
 end

 def home
    if !signed_in?
   	 redirect_to login_path
    end
    @user = current_user
    @request = Request.all
 end

 def profile
 	if !signed_in?
   	 redirect_to login_path
    end
    @user = current_user
 end

def match 
	@requests = Request.all
	@books = Book.all
	@requests.each do |r|
		@books.each do |e|
			@match = Match.new 
			if(r.book_catalog_entrie_id == e.book_catalog_entrie_id)
				@match.book = e
				@match.request = r
				if @match.save
					UserMailer.match_found_owner(@match).deliver
					UserMailer.match_found_requester(@match).deliver
				end
			end
		end
	end
end
 
end
