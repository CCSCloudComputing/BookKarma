class UpdateHasSecurePasswordField < ActiveRecord::Migration
  
  def change
  	remove_column :users, :password
  	remove_column :users, :password_confirmation

  	add_column :users, :password_digest, :string
  	add_column :users, :auth_token, :string

  end

end
