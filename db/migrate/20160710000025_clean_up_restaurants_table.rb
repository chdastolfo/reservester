class CleanUpRestaurantsTable < ActiveRecord::Migration[5.0]
  def change
  	remove_column :restaurants, :owners_id
  	remove_column :restaurants, :encrypted_password
  	remove_column :restaurants, :reset_password_token
  	remove_column :restaurants, :reset_password_sent_at
  	remove_column :restaurants, :remember_created_at
  	remove_column :restaurants, :sign_in_count
  	remove_column :restaurants, :current_sign_in_at
  	remove_column :restaurants, :last_sign_in_at
  	remove_column :restaurants, :current_sign_in_ip
  	remove_column :restaurants, :last_sign_in_ip


  end
end
