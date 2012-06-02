class BooksController < ApplicationController

def create
	@book = Book.new(params[:book])
	@owner = User.find_by_id(@book.user_id)
	@owner.books << @book
	respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'User was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
end

def new
	@book = Book.new
end

def show 
	@books = Book.all
	@owner = Book.find_by_id(params[:id]).user
end

end
