require 'spec_helper'

describe PagesController do
  render_views

    describe "functioning pages" do
    
    describe "GET 'home'" do
      it "should be successful" do
        get 'home'
        response.should be_success
      end
    end

    describe "GET 'sports'" do
      it "should be successful" do
        get 'sports'
        response.should be_success
      end
    end

    describe "GET 'teams'" do
      it "should be successful" do
        get 'teams'
        response.should be_success
      end
    end
  
    describe "GET 'admin'" do
      it "should be successful" do
        get 'admin'
        response.should be_success
      end
    end
  
   end
      
  describe "navigation if not logged in" do
          
    it "should load the splash partial in home" do
      get 'home'
      response.should have_selector('h1', :content => 'Welcome') 
      response.should_not have_selector('h1', :content => 'Fanbase')
      end
      
    end
  
  describe "navigation if logged in" do

    it "should not load the splash partial in home" do
      test_sign_in(Factory(:user))
      get 'home'
      response.should_not have_selector('h1', :content => 'Welcome')
      response.should have_selector('h1', :content => 'Fanbase')
      end
      

      
    
    end












end
