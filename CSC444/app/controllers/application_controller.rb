class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # by default should be logged in, use "skip_before_action :require_login"
  # to avoid this in certain controllers
  before_action :require_login
 
  private
 
  def require_login
    if !(logged_in?)
      flash[:error] = "You must be logged in to access this section!"
      session[:return_to] = request.url;
      redirect_to login_path
    end
  end

end
