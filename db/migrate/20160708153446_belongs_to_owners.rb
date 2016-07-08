class BelongsToOwners < ActiveRecord::Migration[5.0]
  def up
  	  change_table :restaurants do |t|
  	  	t.belongs_to :owners
  	  end
  end
end
