require 'spec_helper'

describe UserType do
	
	before { @userType = UserType.new }

	subject { @userType }
  
	context "when name emtpy" do
		it { should_not be_valid }
		specify { @userType.save.should be_false }
	end

	context "when name not empty" do
		before { @userType.name = "individual" }

		it { should be_valid }
		specify { @userType.save.should be_true }
	end

end
