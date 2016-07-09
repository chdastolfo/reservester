class RestaurantsController < ApplicationController
	
	before_action :authenticate_owner!, except: [:show, :index]
	before_action :set_restaurant, only: [:show]

def index
	@restaurants = Restaurant.all
end

def new
	@restaurants = current_owner.restaurants.new
end

def create
	@restaurants = Restaurant.new(restaurant_params)
	@restaurants = current_owner.restaurants.new(restaurant_params)
	if @restaurants.save
		flash[:success] = "Restaurant was created, bitch."
		redirect_to @restaurants
	else
		render 'new'
	end
end

def show
	#@restaurant = Restaurant.find(params[:id])
end

def edit
	@restaurants = current_owner.restaurants.find(params[:id])
end

def update
	@restaurants = current_owner.restaurants.find(params[:id])
	if @restaurants.update(restaurant_params)
		flash[:success] = "Restaurant was updated, bitch."
		redirect_to @restaurants
	else
		render 'edit'
	end
end

def destroy
	@restaurants = current_owner.restaurants.find(params[:id])
	if @restaurants.destroy
		flash[:danger] = "restaurant was deleted and stuff"
	else
		flash[:danger] = "restaurant was not deleted and stuff"
	end
	redirect_to restaurants_path
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurants = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:owner_id, :name, :content, :address)
    end

end