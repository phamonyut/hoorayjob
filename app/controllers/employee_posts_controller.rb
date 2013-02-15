class EmployeePostsController < ApplicationController
	before_filter :user_signed_in?, :only => [:create]

	def create
		@employee_post = EmployeePost.new(params[:employee_post])
		@employee_post.user = current_user
		@employee_post.status = "Open"
		respond_to do |format|
			if @employee_post.save 
				puts "-- pass"
				format.html {redirect_to root_path, notice: t(:employee_posted_success)}
			else
				puts "-- fails "
				format.html {redirect_to jobpost_path}
			end
		end
	end
end
