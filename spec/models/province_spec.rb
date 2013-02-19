# encoding: utf-8
require 'spec_helper'

describe Province do
  before { @province = Province.new }

	subject { @province }
  
	context "when name emtpy" do
		it { should_not be_valid }
		specify { @province.save.should be_false }
	end

	it "should seed correctly" do
		Province.count.should == 77
		Province.find_by_name('กรุงเทพมหานคร').should be_valid
	end

end
