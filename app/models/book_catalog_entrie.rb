class BookCatalogEntrie < ActiveRecord::Base
	has_many :books
	has_many :requests
  attr_accessible :author, :course, :isbn, :title, :url
end
