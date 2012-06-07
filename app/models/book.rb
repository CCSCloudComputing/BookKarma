class Book < ActiveRecord::Base
	attr_accessible :user_id, :book_catalog_entrie_id, :available
	belongs_to :user
	belongs_to :book_catalog_entrie
end
