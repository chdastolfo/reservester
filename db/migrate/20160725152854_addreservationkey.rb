class Addreservationkey < ActiveRecord::Migration[5.0]
  def change
  	add_reference :reservations, :restaurant, index: true, foreign_key:true
  end
end
