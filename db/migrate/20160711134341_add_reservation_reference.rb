class AddReservationReference < ActiveRecord::Migration[5.0]
  def change
	add_reference :restaurants, :reservations, index: true, foreign_key:true
	add_reference :owners, :reservations, index: true, foreign_key:true

  end
end
