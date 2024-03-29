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
				temp = unSelectedType.split(",")
				condition_sql = Job.all.map(&:job_name).reject{ |e| temp.include? e }
				@employer_posts = EmployerPost.joins(:job).where( 'jobs.job_name' => condition_sql ).all
				@employee_posts = EmployeePost.joins(:job).where( 'jobs.job_name' => condition_sql ).all
			else
				condition_sql = searchType.split(",")
				@employer_posts = EmployerPost.joins(:job).where( 'jobs.job_name' => condition_sql ).all
				@employee_posts = EmployeePost.joins(:job).where( 'jobs.job_name' => condition_sql ).all
			end
		end

		@posts = @employee_posts + @employer_posts

		render :partial => "post_item", :layout => false, :locals => {:posts => @posts}
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
