require 'spec_helper'

describe Job do

	before { @job = Job.new( job_name: "Maid") }

	subject { @job }

	it { should be_valid }

  describe "job name is not present" do
  	before { @job.job_name = "" }
  	it { should_not be_valid}
  end
end
