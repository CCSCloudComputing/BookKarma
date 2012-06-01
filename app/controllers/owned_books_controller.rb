class OwnedBooksController < ApplicationController

def create
	@owned_book = OwnedBook.new(params[:owned_book])
	@owner = User.find_by_id(@owned_book.user_id)
	@owner.owned_books << @owned_book
	respond_to do |format|
      if @owned_book.save
        format.html { redirect_to @owned_book, notice: 'User was successfully created.' }
        format.json { render json: @owned_book, status: :created, location: @owned_book }
      else
        format.html { render action: "new" }
        format.json { render json: @owned_book.errors, status: :unprocessable_entity }
      end
    end
end

def new
	@owned_book = OwnedBook.new
end

def show 
	@owned_books = OwnedBook.all
	@owner = User.find_by_id(OwnedBook.find_by_id(params[:id]).user_id)
end

end
