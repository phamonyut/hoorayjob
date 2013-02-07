class HomeController < ApplicationController

	before_filter :signed_in_user, only: [:hello]

	def index
	end

	def hello
	end

	private
		def signed_in_user
			redirect_to root_path, notice: "Please sign in." unless user_signed_in?
		end

end
