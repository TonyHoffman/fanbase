require 'spec_helper'

describe UsersController do
  render_views

  describe "Get 'index'" do
    
    describe "for non-signed-in users" do
      it "should deny access" do
        get :index
        response.should redirect_to(signin_path)
      end
    end
  end 
    
  
    
    
    
    
    
    

end
