class SessionsController < ApplicationController
  
  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination"
      @title = "Sign in"
      render 'new'
    else
     sign_in user
      if admin?
        redirect_to sports_path
      else
      # redirect_back_or user # here "user" really means user_path
      redirect_to contests_path
    end
  end
  end
  
  def destroy
    sign_out
    redirect_to root_path
    
  end

end
