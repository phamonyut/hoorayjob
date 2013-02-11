require 'spec_helper'

describe "User" do
	describe "GET signup_path" do
    it "works!" do
      get signup_path
      response.status.should be(200)
    end
  end

	describe "Sign up page" do
		it "should have content sign up" do
			visit signup_path(locale:"en")
			page.should have_content('Sign up')
		end
	end

end