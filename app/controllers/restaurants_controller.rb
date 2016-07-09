class RestaurantsController < ApplicationController
	
	before_action :authenticate_owner!, except: [:show, :index]
	before_action :set_restaurants, only: [:show]

def index
	@restaurants = Restaurant.all
end

def new
	@restaurants = current_owner.restaurants.new
end

def create
	@restaurants = current_owner.restaurants.new(restaurant_params)
	if @restaurants.save
		flash[:success] = "Restaurant was created, bitch."
		redirect_to restaurants_path(@restaurant)
	else
		render 'new'
	end
end

def show
	#@restaurants = Restaurant.find(params[:id])
end

def edit
	@restaurent = current_owner.restaurants.find(params[:id])
end

def update
	@restaurants = current_owner.restaurants.find(params[:id])
	if @restaurants.update(restaurant_params)
		flash[:success] = "Restaurant was updated, bitch."
		redirect_to restaurants_path(@restaurant)
	else
		render 'new'
	end
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurants = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:owner_id, :content)
    end

end