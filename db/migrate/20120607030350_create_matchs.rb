class CreateMatchs < ActiveRecord::Migration
  def change
    create_table :matchs do |t|
      t.integer :book
      t.integer :request
      t.timestamps

    end
  end
end
