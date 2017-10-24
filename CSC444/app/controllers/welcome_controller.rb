class WelcomeController < ApplicationController
  skip_before_action :require_login
  
  def index
  	if logged_in?
  		render 'indexLoggedIn'
  	end
  end
end
