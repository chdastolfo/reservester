class ReservationMailer < ApplicationMailer
	default from: "reservations@reservester.com"

	def reservation_notification(reservation)
		debugger
		@reservations = reservation
		@owneremail = reservation.restaurant.owner.email
		mail(:to => @owneremail, :subject => "You've made a new reservation at #{reservations.restaurants.name}")
	end
end
