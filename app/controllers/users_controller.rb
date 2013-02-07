class UsersController < ApplicationController
	
	# GET /registration
	def registration
		@user = User.new
		respond_to do |format|
			format.html 
		end
	end

	# POST /registration
	def create
		@user = User.new(params[:user])
		
		respond_to do |format| 
			if @user.save
				format.html {redirect_to hello_path, notice: "User was successfully created."}
			else
				format.html {render :action => "registration"}
				format.json {render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# GET /login
	def login
		puts "---"
		puts params[:username]
		puts params[:password]
		@user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
		
		respond_to do |format|
			if @user
				format.html { redirect_to hello_path }
			else
				format.html  { redirect_to root_path, :flash => {:error => "Username or Password did not match. Please try again."} }
			end
			
		end
	end

end
