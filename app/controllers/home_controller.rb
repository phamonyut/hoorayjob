class HomeController < ApplicationController

	before_filter :signed_in_user, only: [:hello]

	def index
		employee_posts = EmployeePost.all
		employer_posts = EmployerPost.all
		@posts = employee_posts + employer_posts
		@posts.sort_by! { |e| e.updated_at }.reverse!
	end

	def hello
	end

	private
		def signed_in_user
			redirect_to root_path, notice: "Please sign in." unless user_signed_in?
		end

end
