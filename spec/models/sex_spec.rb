require 'spec_helper'

describe Sex do

	before { @sex = Sex.new }

	subject { @sex }
  
	context "when name emtpy" do
		it { should_not be_valid }
		specify { @sex.save.should be_false }
	end

	context "when name not empty" do
		before { @sex.name = "male" }

		it { should be_valid }
		specify { @sex.save.should be_true }
	end

end
