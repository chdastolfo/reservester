class RestaurantsController < ApplicationController
	
 	before_action :set_restaurants, only: [:show]
	#before_action :authenticate_owner!

def index
	@restaurants = Restaurant.all
end

def new
	@restaurants = Restaurant.new
end

def create
	@restaurants = Restaurant.new(restaurant_params)

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
	@restaurants = Restaurant.find(params[:id])
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurants = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :content)
    end

end