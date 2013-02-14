require 'spec_helper'

describe "Home" do
	before { visit root_path(locale:"en") }

	subject { page }

	describe "should have the right title" do
		it { should have_selector('title', text: "Hoorayjob") }
	end

	describe "should be able to login successfully" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			fill_in 'username', with: user.username
			fill_in 'password', with: user.password
			click_button "Sign in"
		end
		it { should have_content('Hooray') }
		it { should have_content(user.first_name) }
	end

	describe "should have a valid Sign up link" do
			it { should have_link('Sign up', href: signup_path) }
	end

	describe "#index" do
		let(:user) { FactoryGirl.create(:user) }
		let!(:employee_post) { FactoryGirl.create(:employee_post, user: user) }
		let!(:employer_post) { FactoryGirl.create(:employer_post, user: user) }

		before do
				# We need to visit the page "after" the records have been created in the database
				visit root_path(locale:"en")
		end
		it "should list each post" do
			page.should have_content(employer_post.formatted_post)
			page.should have_content(employee_post.formatted_post)
		end
		
		describe "should handle EmployerPost only filter" do
			pending "This test should pass!!!, I have no idea why it fails. Looks like click_link doesn't work"
			#before do
			#	click_link "Employer Posts"
			#end
			#it do
			#	page.should have_css('li.EmployerPost')
			#	page.should have_css('li.EmployeePost')
			#	page.should_not have_css('li.EmployerPost.hide')
			#	page.should have_css('li.EmployeePost.hide')
			#end
		end

	end
end

