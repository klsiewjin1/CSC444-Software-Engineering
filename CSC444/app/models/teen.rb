class Teen < User
  
  # Make this map to just use the User stuff
  def self.model_name
    User.model_name
  end
  
end
