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
		it { should have_content('Sign up') }
		describe "and the link should redirect to the Registration page" do
			before { click_link "Sign up" }
			it { should have_content('Sign up') }
		end
	end
end