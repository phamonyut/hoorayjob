# encoding: utf-8
class HomeController < ApplicationController

	before_filter :signed_in_user, only: [:hello, :post]
	layout :design_layout

	def design_layout
	 case action_name
    when 'theme'
    	'application_theme'
    else
      'application'
	  end
	end

	def theme
	end

	def index
		@employee_posts = EmployeePost.all
		@employer_posts = EmployerPost.all
		@posts = @employee_posts + @employer_posts
		@posts.sort_by! { |e| e.updated_at }.reverse!
	end

	def hello
	end

	def post
		province = Province.find_by_name("กรุงเทพมหานคร")
		@districts = province.districts

		@employee_post = EmployeePost.new
		@employee_post.district = province.districts.first
		@employee_post.province = province
		@employee_post.phone = current_user.phone
		@employee_post.email = current_user.email

		@employer_post = EmployerPost.new
		@employer_post.district = province.districts.first
		@employer_post.province = province
		@employer_post.phone = current_user.phone
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
