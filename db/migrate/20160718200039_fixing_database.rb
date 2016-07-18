class FixingDatabase < ActiveRecord::Migration[5.0]
  def change
  	remove_column :owners, :reservations_id
	rename_column :restaurants, :reservations_id, :reservation_id
	
  end
end
