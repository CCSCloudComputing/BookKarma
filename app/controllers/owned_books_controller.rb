class OwnedBooksController < ApplicationController

def create
	@owned_book = OwnedBook.new
end

def new
	@owned_book = OwnedBook.new
end

def show 
	@owned_books = current_user.owned_books
end

end
