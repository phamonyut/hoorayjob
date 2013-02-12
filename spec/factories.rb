FactoryGirl.define do
	factory :user do
		username "username"
		password "foobar"
		password_confirmation "foobar"
		user_type UserType.new( name: "I" )
		citizen_id "1234567890123"
		first_name "Firstname"
		last_name "Lastname"
		sex Sex.new( name: "M" )
		birthday "2013-02-06"
		phone "080-123-4567"
		email "fullbar@email.com"
		address "1234 RSU Tower, Wattana Bangkok"
		personal_info "Personal Information"
	end
end