class ApplicationController < ActionController::Base
  protect_from_forgery


 def current_user
 	@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
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
			@match.save
			end
		end
	end
end
 
end
