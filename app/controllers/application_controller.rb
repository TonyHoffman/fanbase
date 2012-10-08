class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include Mobylette::RespondToMobileRequests
  mobylette_config do |config|
  config[:fallback_chains] = { mobile: [:mobile, :html] }
    config[:skip_xhr_requests] = false
    # config[:mobile_user_agents] = proc { %r{iphone}i }
    config[:mobile_user_agents] = proc { %r{iphone|ipad|ios|android}i }
    
  end
  
  # has_mobile_fu
  
  include SessionsHelper  #this makes the sessions_helper accessible 
                          # outside the views (defaults to only being 
                          # available in views)
                     
    
                          
end
