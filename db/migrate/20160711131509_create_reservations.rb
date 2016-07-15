class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.datetime :datetime
      t.string :message

      t.timestamps
    end
  end
end
