class ApplicationController < ActionController::Base
	helper_method :current_user, :user_signed_in?, :user_signed_out?
  protect_from_forgery
  before_filter :set_locale

	def current_user
		if session[:user_id] 
			@current_user ||= User.find(session[:user_id])
		end
		@current_user
	end 

	def user_signed_in?
		!!current_user
	end

	def user_signed_out?
		!user_signed_in?
	end

	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

end
