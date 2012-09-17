require 'spec_helper'

describe "LayoutLinks" do

  describe "admin link access" do
  
    before(:each)do
      @admin_user = Factory(:user, :admin => true)
      visit signin_path
      fill_in "Email", :with => @admin_user.email
      fill_in "Password", :with => @admin_user.password
      click_button
    end
            
     it "should show the admin links including the admin link" do
       visit root_path
       response.should have_selector('a', :href => user_path(@admin_user), :content => 'Profile' ) 
       response.should have_selector('a', :href => admin_path, :content => 'Admin' ) 
      end
      
    end
 
  describe "non-admin link access" do

    before(:each)do
      @user = Factory(:user, :admin => false)
      visit signin_path
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      click_button
    end

     it "should show the regular links but NOT the admin link" do
       visit root_path
       response.should have_selector('a', :href => user_path(@user), :content => 'Profile' ) 
       response.should_not have_selector('a', :href => admin_path, :content => 'Admin' ) 
      end

    end
 
 
 
 
 
end