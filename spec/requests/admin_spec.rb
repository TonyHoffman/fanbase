require 'spec_helper'
  
  describe "admin viewing logic and renders" do
    # render_views
    
    it "should load the admin page" do
      get '/admin'
      response.should be_success
    end
    
    
    before(:each)do
      @admin_user = Factory(:user, :admin => true)
    end   
    

end