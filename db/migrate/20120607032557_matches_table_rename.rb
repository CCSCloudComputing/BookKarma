class MatchesTableRename < ActiveRecord::Migration
  

	def change
                rename_table :matchs, :matches
	end
end
