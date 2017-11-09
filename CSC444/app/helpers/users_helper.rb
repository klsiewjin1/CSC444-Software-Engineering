module UsersHelper
  
  # Returns a Gravatar for a given user
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end
  
  def current_user_is_client()
    return true if @current_user.user_type == "client" 
    return false
  end
  
  def current_user_is_teen()
    return true if @current_user.user_type == "teenager" 
    return false
  end

  def user_is_teen(id)
    return true if get_user(id).user_type == "teenager"
  end

  def user_is_client(id)
    return true if get_user(id).user_type == "client"
  end

  def get_user(user_id)
    return User.find_by_id(user_id)
  end
end
