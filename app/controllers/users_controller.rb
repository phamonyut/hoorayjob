class UsersController < ApplicationController
	before_filter :user_signed_in?, :only => [:signout]
	layout :resolve_layout

	def resolve_layout
    case action_name
    when 'signup2'
    	'application2'
    else
      'application'
	  end
  end

	# GET /signup
	def signup
		@user = User.new
		respond_to do |format|
			format.html 
		end
	end

	# GET /signup
	def signup2
		@user = User.new
		respond_to do |format|
			format.html 
		end
	end

	# POST /signup
	def create
		@user = User.new(params[:user])
		respond_to do |format| 
			if @user.save
				session[:user_id] = @user.id
				format.html {redirect_to hello_path, notice: "User was successfully created."}
			else
				format.html {render action: "signup"}
				format.json {render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# POST /signin
	def signin
		user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
		respond_to do |format|
			if user
				session[:user_id] = user.id
				format.html { redirect_to hello_path, notice: "Sign in successfully." }
			else
				format.html  { redirect_to root_path, flash: {error: "Username or Password did not match. Please try again."} }
			end
		end
	end

	# GET /signout
	def signout
		puts "call signout"
		session.delete(:user_id)
		respond_to do |format|
			format.html { redirect_to root_path, notice: "Sign out successfully." }
		end
	end

end
