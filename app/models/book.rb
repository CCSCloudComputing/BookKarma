class Book < ActiveRecord::Base
	has_many :owned_books
  attr_accessible :author, :course, :isbn, :title, :url
end
