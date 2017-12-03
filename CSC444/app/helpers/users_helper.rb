module UsersHelper
  
  include Math
  
  EARTH_RADIUS = 6371 # in km
  
  # Returns a Gravatar for a given user
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end

  def user_is_teen(user)
    # return true if get_user(id).user_type == "teenager" -> doesn't work when get_user returns nil
    return (user != nil && user.user_type == "teenager")
  end

  def user_is_client(user)
    # return true if get_user(id).user_type == "client" -> doesn't work when get_user returns nil
    return (user != nil && user.user_type == "client")
  end
  
  def user_is_admin(user)
    # return true if get_user(id).user_type == "admin" -> doesn't work when get_user returns nil
    return (user != nil && user.user_type == "admin")
  end
  
  def current_user_is_teen()
    # return @current_user.user_type
    return user_is_teen(@current_user)
  end
  
  def current_user_is_client()
    return user_is_client(@current_user)
  end
  
  def current_user_is_admin()
    return user_is_admin(@current_user)
  end

  def get_user(user_id)
    return User.find_by_id(user_id)
  end
  
  def get_user_full_name(user)
    return user.fname + ' ' + user.lname
  end
  
  def get_user_name_by_id(user_id)
      user = User.find(user_id)
      if user.nil?
          return -1
      else
          return user.username
      end
  end
  
  def get_full_address(user)
    if user.address and user.city and user.country
      return user.address + ', ' + user.city + ', ' + user.country
    else
      return nil
    end
  end
  
  def get_distance_between_users(user1, user2)
    # only using this while testing lat/long, in the future all users will always have lat/long so it won't be necessary to check here
    if !user1.lat or !user1.long or !user2.lat or !user2.long
      return 1000000 # 1 million km is way bigger than any legitimate radius for Earth
    end
    
    lat1_radians = user1.lat * PI / 180
    lat2_radians = user2.lat * PI / 180
    long1_radians = user1.long * PI / 180
    long2_radians = user2.long * PI / 180
    
    dlat = lat2_radians - lat1_radians 
    dlong = long2_radians - long1_radians
    a = (sin(dlat/2) ** 2) + cos(lat1_radians) * cos(lat2_radians) * (sin(dlong/2) ** 2) 
    c = 2 * atan2( sqrt(a), sqrt(1-a) ) 
    d = EARTH_RADIUS * c
    
    return d
  end
  
  # using SQL query instead of O(n) search, but does not make much difference in performance
  def get_clients_within_radius(teen, radius)
    # convert latitude and longitude of teen to radians
    lat_rad = teen.lat * PI / 180
    long_rad = teen.long * PI / 180
    
    # calculate sin and cos of teen latitude to prevent calculating it for every table row during the query
    sin_lat_rad = sin(lat_rad)
    cos_lat_rad = cos(lat_rad)
    
    if Rails.configuration.database_configuration[Rails.env]['database'] == 'development'
      return User.all.where(user_type: 'client').where('acos((? * sin(lat * ?)) + (? * cos(lat * ?) * cos((`long` * ?) - ?))) * ? < ?', sin_lat_rad, PI / 180, cos_lat_rad, PI / 180, PI / 180, long_rad, EARTH_RADIUS, radius).to_a
    else
      return User.all.where(user_type: 'client').where('acos((? * sin(lat * ?)) + (? * cos(lat * ?) * cos((long * ?) - ?))) * ? < ?', sin_lat_rad, PI / 180, cos_lat_rad, PI / 180, PI / 180, long_rad, EARTH_RADIUS, radius).to_a
    end
  end


  def viewing_own_profile()
    return true if params[:id] == session[:user_id]
    else return false
    
  end
  # temporary version, actual version will use SQL query which will make the performance significantly better
  # def get_clients_within_radius(teen, radius)
  #   clients = []
    
  #   User.all.where(user_type: 'client').each do |client|
  #     if get_distance_between_users(teen, client) <= radius
  #       clients.push(client)
  #     end
  #   end
    
  #   return clients
  # end

end
