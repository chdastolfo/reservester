class RestaurantsController < ApplicationController
	before_action :set_restaurant, only: [:show]

def index
	@restaurant = Restaurant.all
end

def new
	@restaurant = Restaurant.new
end

def create
	@restaurant = Restaurant.new(restaurant_params)

	respond_to do |format|
		if @restaurant.save
			format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.'}
			format.json { render :show, restaurant: :created, location: @restaurant }
		else
			format.html { render :new }
			format.json { render json: @restaurant.errors, status: :unprocessable_entity }
		end
	end
end

def show
	
end

end