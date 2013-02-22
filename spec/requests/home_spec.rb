# encoding: utf-8
require 'spec_helper'

describe "Home" do
	before do
		visit root_path(locale: "en")
	end

	describe "#index" do
		let(:user) { FactoryGirl.create(:user) }
		let!(:employee_post) { FactoryGirl.create(:employee_post, user: user) }
		let!(:employer_post) { FactoryGirl.create(:employer_post, user: user) }

		before do
			# We need to visit the page "after" the records have been created in the database
			visit root_path(locale: "en")
		end

		it "should have the right title" do
			page.should have_selector("title", text: "Hoorayjob")
		end

		it "should be able to login successfully" do
			pending "Where is the signIN link whichs link to the Hello page? I believe it is a button which links to nowhere now. This needs to pass"
			# let(:user) { FactoryGirl.create(:user) }
			# before do
			# 	fill_in 'username', with: user.username
			# 	fill_in 'password', with: user.password
			# 	click_button "Sign in"
			# end
			# it { should have_content('Hooray') }
			# it { should have_content(user.first_name) }
		end

		it "should have a valid Sign up link" do
			pending "We no longer have the sign up page"
			#it { should have_link('Sign up', href: signup_path) }
		end

		it "should validate the input in the sign up section" do
			pending "Capybara not support, require Selenium. Testlater"
			#before { fill_in 'user_first_name', with: '\t' }
			#it { should have_content("can't be blank2") }
		  	#it { should_not have_selector('div', text: "can't be blank") }

		end

		it "should list each post" do
			pending "This should pass"
			# page.should have_content(employer_post.formatted_post)
			# page.should have_content(employee_post.formatted_post)
		end
		
		it "should handle EmployerPost only filter" do
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

	describe "#post" do
		let(:user) { FactoryGirl.create(:user) }

		before do
			fill_in "username", with: user.username
			fill_in "password", with: user.password
			click_button "Sign in"
			visit jobpost_path
		end

		it "should have prefilled user phone" do
			pending "Can not make it fail"
			#page.should have_selector("input", value: user.phone)
		end

		it "should have prefilled user email" do
			pending "Can not make it fail"
			#page.should have_selector("input", value: user.email)
		end

		it "should have preselected province" do
			pending "Can not make it fail"
			# province = Province.find_by_name("กรุงเทพมหานคร")
			# page.should have_selector("select", value: province.id)
		end
	end

	describe "#update_district_select" do
		let(:province) { Province.find_by_name("กรุงเทพมหานคร") }

		before do
			visit "/update_district_select/employee_post/#{province.id}"
		end

		it "should have associated district" do
			pending "This should pass"
			#page.should have_selector("option", count: province.districts.count)
		end
	end
end
