module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end
  
  # Get the currently logged in user, if there is one and store in an instance variable
  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    end
    
    return @current_user
  end
  
end
