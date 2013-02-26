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

	# POST /signup
	def create
		@user = User.new(params[:user])
		respond_to do |format| 
			if @user.save
				session[:user_id] = @user.id
				format.html {redirect_to root_path, notice: t(:user_created_success)}
			else
				format.html {render root_path}
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
				format.html { redirect_to root_path, notice: t(:signin_success) }
			else
				format.html  { redirect_to root_path, flash: {logonError: t(:signin_fail)} }
			end
		end
	end

	# GET /signout
	def signout
		puts "call signout"
		session.delete(:user_id)
		respond_to do |format|
			format.html { redirect_to root_path, notice: t(:signout_success) }
		end
	end

	def isUsernameValid
		respond_to do |format|
			@username = params[:username]
			if @username.blank?
				format.html { render nothing: true, status: :no_content }
			elsif	User.find_by_username(@username)
				format.json { render json: { error_message: "errors.messages.taken" }, status: :non_authoritative_information }
			else
				format.html { render nothing: true }
			end
		end
	end

end
