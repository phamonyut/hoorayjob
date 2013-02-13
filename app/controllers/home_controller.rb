class HomeController < ApplicationController

	before_filter :signed_in_user, only: [:hello, :post]

	def index
	end

	def hello
	end

	def post
		@employee_post = EmployeePost.new
		@employer_post = EmployerPost.new
		respond_to do |format|
			format.html 
		end
	end

	private
		def signed_in_user
			redirect_to root_path, notice: "Please sign in." unless user_signed_in?
		end

end
