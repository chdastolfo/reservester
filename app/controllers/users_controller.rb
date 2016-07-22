class UsersController < ApplicationController
	before_filter :authenticate_owner!

	def dashboard
		@user = current_user
		@restaurants = current_user.restaurants
	end
end
