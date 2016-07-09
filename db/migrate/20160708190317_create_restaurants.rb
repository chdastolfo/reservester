class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    
  	add_column :restaurants, :content, :string

  end
end
