class BookCatalogEntrie < ActiveRecord::Base
	has_many :books
  attr_accessible :author, :course, :isbn, :title, :url
end
