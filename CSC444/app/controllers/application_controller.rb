class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper

  # by default should be logged in, use "skip_before_action :require_login"
  # to avoid this in certain controllers
  before_action :require_login
  
  
  before_action :check_activated
 
  private
 
  def require_login
    if !(logged_in?)
      flash[:error] = "You must be logged in to access this section!"
      session[:return_to] = request.url;
      redirect_to login_path
    end
  end
  
  def check_activated
    if logged_in? and !current_user.activated?
      flash[:warning] = "Account not activated!"
    end
  end
end
