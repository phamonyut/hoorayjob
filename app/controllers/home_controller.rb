class HomeController < ApplicationController

	before_filter :signed_in_user, only: [:hello, :post]

	def index
		employee_posts = EmployeePost.all
		employer_posts = EmployerPost.all
		@posts = employee_posts + employer_posts
		@posts.sort_by! { |e| e.updated_at }.reverse!
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
