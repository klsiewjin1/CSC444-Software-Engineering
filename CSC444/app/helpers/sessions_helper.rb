# Manages logging in the user and logging them out. Handles the session hash
# and provides the current user object through the current_user method.
module SessionsHelper
  def login(user)
    session[:user_id] = user.id;
  end

  # logs the user out. Subsequent calls do nothing. The method current_user will 
  # return nil after this call until login(user) is called again.
  def logout()
    session.delete(:user_id);
    @current_user = nil;
  end
  
  # Get the currently logged in user, if there is one and store in an instance variable
  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    end
    
    return @current_user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
end
