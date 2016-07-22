class CreateRoles < ActiveRecord::Migration[5.0]
  def change
  	rename_table('owners', 'users')
  end
end
