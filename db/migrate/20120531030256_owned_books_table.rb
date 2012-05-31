class OwnedBooksTable < ActiveRecord::Migration
  
  def change
    create_table :owned_books do |t|
      t.integer  :userid
      t.integer  :bookid
    end
end 
end
