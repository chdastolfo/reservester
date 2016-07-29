class RestaurantsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]

def index
	@restaurants = Restaurant.all
end

def new
	@restaurant = Restaurant.new
end

def create
	@restaurants = Restaurant.new(restaurant_params)
	@restaurants = current_user.restaurants.new(restaurant_params)
	if @restaurants.save
		flash[:success] = "Restaurant was created, bitch."
		redirect_to @restaurants
	else
		render 'new'
	end
end

def show
	@restaurant = Restaurant.find(params[:id])
	@reservations = Reservation.where(restaurant_id: params[:id])
end

def edit
	@restaurants = current_user.restaurants.find(params[:id])
end

def update
	@restaurant = current_user.restaurants.find(params[:id])
	if @restaurant.update(restaurant_params)
		flash[:success] = "Restaurant was updated, bitch."
		redirect_to @restaurant
	else
		render 'edit'
	end
end

def destroy
	@restaurant = Restaurant.find(params[:id])
	@restaurant.destroy
	if @restaurant.destroy
		flash[:danger] = "restaurant was deleted and stuff"
	else
		flash[:danger] = "restaurant was not deleted and stuff"
	end
	redirect_to restaurants_path
end

private

     # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:owner_id, :name, :content, :address)
    end

end