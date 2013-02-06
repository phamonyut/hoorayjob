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

		@user = User.new(params[:user])
		
		respond_to do |format|
			if @user.save
				format.html {redirect_to root_path, notice: "User was successfully created."}
			else
				format.html {render :action => "registration"}
				format.json {render json: @user.errors, status: :unprocessable_entity }
			end
		end
		
	end

end
