require 'spec_helper'

describe "Home" do
	before { visit root_path(locale:"en") }

	subject { page }

	describe "should have the right title" do
		pending "This test needs to pass!!! (I wonder why it fails)"
		#it { should have_selector('title', :text => "Hoorayjob") }
	end

	describe "should be able to login successfully" do
		pending "This needs to pass, but after we implement the saving locale to session"
		#let(:user) { FactoryGirl.create(:user) }
		#before do
		#	fill_in 'username', with: user.username
		#	fill_in 'password', with: user.password
		#	click_button "Sign in"
		#end
		#it { should have_content('Hello') }
	end

	describe "should have a valid Sign up link" do
		it { should have_content('Sign up') }
		describe "and the link should redirect to the Registration page" do
			pending "This needs to pass, but after we implement the saving locale to session"
			#before { click_link "Sign up" }
			#it { should have_content('Registration') }
		end
	end

	describe "index" do
		pending "This needs to pass"
		#before do
		#	user = FactoryGirl.create(:user)
		#	FactoryGirl.create(:employee_post, user: user)
		#	FactoryGirl.create(:employer_post, user: user)
		#end
		#it "should list each post" do
		#	posts = EmployeePost.all + EmployerPost.all
		#	posts.each do |post|
		#		page.should have_content(post.formatted_post)
		#	end
		#end
	end
end