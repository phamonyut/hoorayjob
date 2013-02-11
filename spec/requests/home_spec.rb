require 'spec_helper'

describe "Home" do

	it "should have the right title" do
		pending "This test needs to pass!!!"
		visit root_path
		page.should have_selector('title', :text => "Hoorayjob")
	end

	let(:user) { FactoryGirl.create(:user) }
	it "should be able to login successfully" do
		visit root_path
		fill_in 'username', with: user.username
		fill_in 'password', with: user.password
		click_button "Sign in"
		page.should have_content('Hello')
	end

	it "should have a valid Sign up link" do
		visit root_path
		page.should have_content('Sign up')
		click_link "Sign up"
		page.should have_content('Registration') 
	end
end