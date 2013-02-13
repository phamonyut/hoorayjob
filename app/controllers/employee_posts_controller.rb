class EmployeePostsController < ApplicationController
	before_filter :user_signed_in?, :only => [:create]
	def create
		@employee_post = EmployeePost.new(params[:employee_post])
		@employee_post.user_id = session[:user_id]
		@employee_post.status = "Open"
		respond_to do |format|
			if @employee_post.save 
				format.html {redirect_to root_path, notice: t(:employee_posted_success)}
			end
		end
	end
end
