class RequestTable < ActiveRecord::Migration

  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :book_id
      
      t.timestamps
    end
  end
end
