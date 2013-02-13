class EmployerPostsController < ApplicationController
	before_filter :user_signed_in?, :only => [:create]
	def create
		@employer_post = EmployerPost.new(params[:employer_post])
		@employer_post.user_id = session[:user_id]
		@employer_post.status = "Open"
		respond_to do |format|
			if @employer_post.save 
				format.html {redirect_to root_path, notice: t(:employer_posted_success)}
			end
		end
	end
end
