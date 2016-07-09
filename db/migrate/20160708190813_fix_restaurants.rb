class FixRestaurants < ActiveRecord::Migration[5.0]
  def change
	remove_column :restaurants, :content, :string
	add_column :restaurants, :content, :text
  end
end
