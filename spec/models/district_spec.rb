# encoding: utf-8
require 'spec_helper'

describe District do
  before { @district = District.new }

	subject { @district }
  
	context "when name emtpy" do
		it { should_not be_valid }
		specify { @district.save.should be_false }
	end

	it "should seed correctly" do
		District.count.should == 926
		district = District.find_by_name('ภาษีเจริญ')
		district.should be_valid
		district.province.name.should == 'กรุงเทพมหานคร'
	end

end
