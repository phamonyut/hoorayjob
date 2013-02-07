class ApplicationController < ActionController::Base
	helper_method :current_user, :user_signed_in?, :user_signed_out?
  protect_from_forgery

	def current_user
		puts "call current_user"
		puts "session[:user_id]: #{session[:user_id]}"
		if session[:user_id] 
			@current_user ||= User.find(session[:user_id])
		end
		@current_user
	end 

	def user_signed_in?
		puts "call user_signed_in?"
		puts "current_user: #{current_user}"
		!!current_user
	end

	def user_signed_out?
		puts "call user_signed_out"
		!user_signed_in?
	end

end
