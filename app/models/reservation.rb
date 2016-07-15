class Reservation < ApplicationRecord
	attr_accessible :email, :datetime, :message, :restaurant_id

	belongs_to :restaurant
end
