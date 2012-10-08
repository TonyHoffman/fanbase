class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include Mobylette::RespondToMobileRequests
  mobylette_config do |config|
  config[:fallback_chains] = { mobile: [:mobile, :html] }
    config[:skip_xhr_requests] = false
    # config[:mobile_user_agents] = proc { %r{iphone}i }
    config[:mobile_user_agents] = proc { %r{palm
                                          blackberry
                                          nokia
                                          phone
                                          midp
                                          mobi
                                          symbian
                                          chtml
                                          ericsson
                                          minimo
                                          audiovox
                                          motorola
                                          samsung
                                          telit
                                          upg1
                                          windows\ ce
                                          ucweb
                                          astel
                                          plucker
                                          x320
                                          x240
                                          j2me
                                          sgh
                                          portable
                                          sprint
                                          docomo
                                          kddi
                                          softbank
                                          android
                                          mmp
                                          pdxgw
                                          netfront
                                          xiino
                                          vodafone
                                          portalmmm
                                          sagem
                                          mot-
                                          sie-
                                          ipod
                                          up.b
                                          webos
                                          amoi
                                          novarra
                                          cdm
                                          alcatel
                                          pocket
                                          ipad
                                          iphone
                                          mobileexplorer
                                          mobile
                                          maemo
                                          fennec
                                          silk}i }
    
  end
  
  # has_mobile_fu
  
  include SessionsHelper  #this makes the sessions_helper accessible 
                          # outside the views (defaults to only being 
                          # available in views)
                     
    
                          
end
