class ReservationsController < ApplicationController
	before_action :authenticate_owner!, :except => [:index, :show]
	
	def new
		@reservation = Reservation.new
	end

	def index		
		@reservations = Reservation.all
	end

	def create
		@reservation = Reservation.all
		@reservation = Reservation.create(reservation_params)
		if @reservation.save
			ReservationMailer.reservation_notification(@reservation).deliver
			redirect_to @restaurant, :notice => 'You have successfully made a reservation.'
		else
			render '/', :notice => 'Something went wrong. Please try again.'
		end
	end

	def destroy
		@reservation.destroy

		resdirect to @reservation.restaurants
	end

	private
	def reservation_params
		params.require(:reservation).permit(:email, :datetime, :message, :restaurant_id)
end
end