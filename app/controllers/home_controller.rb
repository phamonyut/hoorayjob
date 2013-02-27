# encoding: utf-8
class HomeController < ApplicationController

	before_filter :signed_in_user, only: [:hello, :post, :post2, :post3]
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
		@user = User.new
	end

	def index
		unless user_signed_in?
			@user = User.new
		end
		@employee_posts = EmployeePost.all
		@employer_posts = EmployerPost.all
		@posts = @employee_posts + @employer_posts
		@posts.sort_by! { |e| e.updated_at }.reverse!
	end

	def filter
		searchType = params[:searchType]
		unSelectedType = params[:unSelected]
		selectOthers = searchType.match(/\bothers\b/) != nil
		isAllCase = searchType.blank? || 
				searchType == "all" || 
				( selectOthers && 
					unSelectedType.blank? )

		if isAllCase
			@employer_posts = EmployerPost.all
			@employee_posts = EmployeePost.all
		else
			if selectOthers
				condition_sql = "'" + unSelectedType.split(",").join("','") + "'"
				@employer_posts = EmployerPost.other_type( condition_sql )
				@employee_posts = EmployeePost.other_type( condition_sql )
			else
				condition_sql = "'" + searchType.split(",").join("','") + "'"
				@employer_posts = EmployerPost.selected_type( condition_sql )
				@employee_posts = EmployeePost.selected_type( condition_sql )
			end
		end

		@posts = @employee_posts + @employer_posts

		# render(:update) do |page|
		# 	page.replace_html 'post-contents', :partial => 'post_item', :object => @posts 
		# end
	end

	def hello
	end

	def post
		province = Province.find_by_name("กรุงเทพมหานคร")
		@districts = province.districts

		@employee_post = EmployeePost.new
		@employee_post.pay_period = "monthly"
		@employee_post.province = province
		@employee_post.phone = current_user.phone
		@employee_post.email = current_user.email

		@employer_post = EmployerPost.new
		@employer_post.pay_period = "monthly"
		@employer_post.province = province
		@employer_post.phone = current_user.phone
		@employer_post.email = current_user.email
		
		respond_to do |format|
			format.html 
		end
	end

	def update_district_select
		@districts = District.where(province_id: params[:id])
		render partial: "districts", locals: { name: params[:name] }
	end

	def post2
		@employee_post = EmployeePost.new
		@employer_post = EmployerPost.new
	end

	def post3
		@employee_post = EmployeePost.new
		@employer_post = EmployerPost.new
	end

	private
		def signed_in_user
			redirect_to root_path, flash: {error: t(:please_signin)} unless user_signed_in?
		end

end
