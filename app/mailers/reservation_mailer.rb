class ReservationMailer < ApplicationMailer
	default from: "reservations@reservester.com"

	def reservation_notification()
		#debugger
		#@reservations = reservation
		#@owneremail = reservation.restaurant.owner.email
		mail(:to=> 'chdastolfo@gmail.com', :subject=>'You have made a new reservation.')
	end
end
