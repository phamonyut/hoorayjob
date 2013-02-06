require 'spec_helper'

describe "Home" do

	it "should have the right title" do
		visit root_path
		page.should have_selector('title', :text => "Hoorayjob")
	end

	it "should be able to login successfully" do
		visit root_path
		fill_in 'userName', with: "John"
		fill_in 'password', with: "John1234"
		click_button "Login"
		page.should have_content('Hello')
	end

	it "should have a valid Sign up link" do
		visit root_path
		page.should have_content('Sign up')
		click_link "signUp"
		page.should have_content('Registration')
	end
end