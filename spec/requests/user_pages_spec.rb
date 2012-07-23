require 'spec_helper'

describe "User pages" do

  subject { page }

  #describe "index" do

    #let(:user) { FactoryGirl.create(:user) }

    #before(:all) { 30.times { FactoryGirl.create(:user) } }
    #after(:all)  { User.delete_all }

    #before(:each) do
      #sign_in user
      #visit users_path
    #end

   # it { should have_selector('title', text: 'All users') }
   # it { should have_selector('h1',    text: 'All users') }

    
   #  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end


        
  describe "signup" do
    
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end


    describe "with valid information" do

      before do
        fill_in "Name",         with: "Exagggmple User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"        
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end

