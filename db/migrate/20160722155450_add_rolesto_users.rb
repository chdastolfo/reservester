class AddRolestoUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :role, :string, null: false, default: "patron"
  end
end
