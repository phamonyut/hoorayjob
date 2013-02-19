require 'spec_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should be_valid }

  describe "when username is not present" do
  	before { @user.username = "" }
  	it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = "" }
    it { should_not be_valid }
  end

  describe "when password confirmation is not present" do
    before { @user.password_confirmation = "" }
    it { should_not be_valid }
  end

  describe "when user type is not present" do
    before { @user.user_type = nil }
    it { should_not be_valid }
  end

  describe "when first name is not present" do
    before { @user.first_name = "" }
    it { should_not be_valid }
  end

  describe "when phone is not present" do
    before { @user.phone = "" }
    it { should_not be_valid }
  end

  describe "when address is not present" do
    before { @user.address = "" }
    it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = "" }
  	it { should be_valid }
  end
	
  # User name
  describe "User name" do

    describe "when duplicate username is entered" do
      before do 
        user_with_same_username = @user.dup
        user_with_same_username.email = "email@email.com"
        user_with_same_username.citizen_id = "3210987654321"
        user_with_same_username.user_type = UserType.new( name: "individual")
        user_with_same_username.sex = Sex.new( name: "male")

        user_with_same_username.save      
      end
      it { should_not be_valid }
    end

    describe "when duplicate username is in capital" do
      before do 
        user_with_same_username = @user.dup
        user_with_same_username.email = "email@email.com"
        user_with_same_username.citizen_id = "3210987654321"
        user_with_same_username.user_type = UserType.new( name: "individual")
        user_with_same_username.sex = Sex.new( name: "male")
        user_with_same_username.username = @user.username.upcase
        user_with_same_username.save      
      end
      it { should_not be_valid }
    end
  end
  
  # Citizen ID
  describe "Citizen ID" do

    describe "when duplicate id is entered" do
      before do
        user_with_same_citizen_id = @user.dup
        user_with_same_citizen_id.username = "username2"
        user_with_same_citizen_id.email = "email@email.com"
        user_with_same_citizen_id.user_type = UserType.new( name: "individual")
        user_with_same_citizen_id.sex = Sex.new( name: "male")
        user_with_same_citizen_id.save
      end
      it { should_not be_valid }
    end

    describe "when incorrect type id is entered" do
      before do
        @user.citizen_id = "123abc"
      end
      it { should_not be_valid }
    end

    describe "when too long id is entered" do
      before do
        @user.citizen_id = "12345678901234"
      end
      it { should_not be_valid }
    end

    describe "when too short id is entered" do
      before do
        @user.citizen_id = "123456789012"
      end
      it { should_not be_valid }
    end

  end

  # Email test
	describe "Email" do
		
    describe "when email is empty" do
      before do
        @user.email = " "
      end
      it { should be_valid }
    end

    describe "when email is correct format" do
	  	it { should be_valid }
	  end  
		
    describe "when email is incorrect format" do
	  	before { @user.email = "email@" }
	  	it { should_not be_valid }
	  end

    describe "when email is already taken" do
      before do 
        user_with_same_email = @user.dup
        user_with_same_email.username = "username2"
        user_with_same_email.citizen_id = "3210987654321"
        user_with_same_email.user_type = UserType.new( name: "individual")
        user_with_same_email.sex = Sex.new( name: "male")
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end
    
      it { should_not be_valid }
    end

    describe "when email is entered in captial" do
      before do 
        @user.email = @user.email.upcase
        @user.save
      end

      its(:email) { should == @user.email.downcase }
    end

	end

  # User Type
  describe "User Type" do

    describe "when user type is incorrect" do
      pending "This constraint is no longer enforced."
      #before do
      #  @user.user_type = "Individual"
      #end
      #it { should_not be_valid }
    end

  end

  # Sex
  describe "Sex" do

    describe "when sex is incorrect" do
      pending "This constraint is no longer enforced."
      #before do
      #  @user.sex = "Male"
      #end
      #it { should_not be_valid }
    end

  end

end
