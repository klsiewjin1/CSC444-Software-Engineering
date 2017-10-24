class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end
  
  def create
    # Try to find and authenticate the user
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_back_or_default(root_path)
    else
      # Login failed
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
      logout()
      clean()
      redirect_to root_path
  end

  # redirects users back to the previous page they were 
  # logging in from or to the default path as specified
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def clean()
    session[:return_to] = nil
  end
end