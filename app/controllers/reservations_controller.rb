class ReservationsController < ApplicationController
	before_filter :get_restaurant, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@reservations = Reservation.all
	end

	def show
		@reservation = Reservation.find(params[:restaurant_id])
	end

	def create
		@reservation = Reservation.new(reservation_params)
		if @reservation.save
			ReservationMailer.reservation_notification(@reservation).deliver
			redirect_to reservations_path, :notice => 'You have successfully made a reservation.'
		else
			render 'restaurant/show', :notice => 'Something went wrong. Please try again.'
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


	protected

		def get_restaurant
			@restaurant = Restaurant.find(params[:restaurant_id])
		end

end