class HomeController < ApplicationController

	before_filter :signed_in_user, only: [:hello, :post]

	def index
		@employee_posts = EmployeePost.all
		@employer_posts = EmployerPost.all
		@posts = @employee_posts + @employer_posts
		@posts.sort_by! { |e| e.updated_at }.reverse!
	end

	def hello
	end

	def post
		@employee_post = EmployeePost.new
		@employee_post.tel = current_user.phone
		@employee_post.email = current_user.email

		@employer_post = EmployerPost.new
		@employer_post.tel = current_user.phone
		@employer_post.email = current_user.email
		
		respond_to do |format|
			format.html 
		end
	end

	def post2
		@employee_post = EmployeePost.new
		@employer_post = EmployerPost.new
		respond_to do |format|
			format.html 
		end
	end

	private
		def signed_in_user
			redirect_to root_path, flash: {error: t(:please_signin)} unless user_signed_in?
		end

end
