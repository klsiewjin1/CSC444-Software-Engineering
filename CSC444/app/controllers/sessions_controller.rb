class SessionsController < ApplicationController
  def new
  end
  
  def create
    
    # Try to find and authenticate the user
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to user
    else
      # Login failed
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
  end
end