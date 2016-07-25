class FavoritesController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		begin
			@restaurant.favorited_by << current_user
			redirect_to @restaurant, :notice => 'You have successfully favorited this restaurant.'
		rescue ActiveRecord::RecordInvalid
			puts "Whoops"
		end
		@restaurants = Restaurant.all
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@restaurant.favorited_by.delete(current_user)
		redirect_to @restaurant, :notice => 'You have successfully unfavorited this restaurant.'
		@restaurants = Restaurant.all
	end

end