class ReservationsController < ApplicationController
	before_action :authenticate_owner!, :except => [:index, :show]

	def create
		@restaurant = Restaurant.find params[:restaurant_id]
		@reservation = @restaurant.reservations.new params[:reservation]

		if @reservations.save
			ReservationMailer.reservation_notification(@reservation).deliver
			redirect_to @restaurants, :notice => 'You have successfully made a reservation.'
		else
			render 'restaurant/show', :notice => 'Something went wrong. Please try again.'
		end
	end

	def destroy
		@reservation.destroy

		resdirect to @reservation.restaurants
	end
end