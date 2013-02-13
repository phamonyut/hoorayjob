FactoryGirl.define do
	factory :user_type do
		name "individual"
	end

	factory :sex do
		name "male"
	end

	factory :user do
		username "username"
		password "foobar"
		password_confirmation "foobar"
		user_type
		citizen_id "1234567890123"
		first_name "Firstname"
		last_name "Lastname"
		sex
		birthday "2013-02-06"
		phone "080-123-4567"
		email "fullbar@email.com"
		address "1234 RSU Tower, Wattana Bangkok"
		personal_info "Personal Information"
	end

	factory :job do
		job_name "housekeeper"
	end

	factory :employee_post do
		user
		job
		status "O"
		min_salary 10000
		max_salary 15000
		year_of_experience 3
		district "Din-Dang"
		province "Bangkok"
	end

	factory :employer_post do
		user
		job
		status "O"
		min_salary 12000
		max_salary 14000
		year_of_experience 5
		sex
		min_age 25
		max_age 30
		district "Din-Dang"
		province "Bangkok"
	end
end