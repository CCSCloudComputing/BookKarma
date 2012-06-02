class OwnedBooksTable < ActiveRecord::Migration
  
  def change
    create_table :owned_books do |t|
      t.integer  :user_id
      t.integer  :book_id
    end
end 
end
