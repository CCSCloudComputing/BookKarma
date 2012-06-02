class RenameSchemas < ActiveRecord::Migration
	def change
		rename_table :books, :book_catalog_entries
		rename_table :owned_books, :books
	end
end
