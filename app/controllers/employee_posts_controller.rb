class EmployeePostsController < ApplicationController
	before_filter :user_signed_in?, :only => [:create]
	def create
		@employee_post = EmployeePost.new(params[:employee_post])
		@employee_post.user_id = session[:user_id]
		@employee_post.status = "Open"
		respond_to do |format|
			if @employee_post.save 
				format.html {redirect_to root_path, notice: t(:employee_posted_success)}
			else
				puts "-- #{@employee_post.errors.full_messages} "
				format.html {redirect_to jobpost_path}
			end
		end
	end
end
