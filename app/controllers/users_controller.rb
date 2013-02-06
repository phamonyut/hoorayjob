class UsersController < ApplicationController
	
	# new
	def registration
		puts "-- call registration"
		@user = User.new
		respond_to do |format|
			format.html 
		end
	end

	# POST /users
	def create
		puts "-- call create user"
	end

end
