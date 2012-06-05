class FixingRequestsTable < ActiveRecord::Migration
  def change
        remove_column :requests, :book_id

        add_column :requests, :book_catalog_entrie_id, :integer
  end
 end

