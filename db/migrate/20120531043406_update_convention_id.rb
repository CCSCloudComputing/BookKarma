class UpdateConventionId < ActiveRecord::Migration
  def change
  	remove_column :owned_books, :userid
  	remove_column :owned_books, :bookid

  	add_column :owned_books, :user_id, :integer
  	add_column :owned_books, :book_id, :integer

  end
end
