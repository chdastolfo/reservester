class AddOwnerRefToRestaurants < ActiveRecord::Migration[5.0]
  def change
  	add_reference :restaurants, :owner, index: true, foreign_key:true
  	add_column :restaurants, :address, :string
  	add_column :restaurants, :name, :string
  	remove_column :restaurants, :email
  end
end
