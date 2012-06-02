class Book < ActiveRecord::Base
	has_many :owned_books
	has_many :requests
  attr_accessible :author, :course, :isbn, :title, :url
end
