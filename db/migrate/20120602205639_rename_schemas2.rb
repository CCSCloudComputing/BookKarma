class RenameSchemas2 < ActiveRecord::Migration
  def change
  	rename_column :books, :book_id, :book_catalog_entrie_id
  end
end
