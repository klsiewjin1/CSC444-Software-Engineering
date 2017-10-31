module ServiceListingsHelper
  
  def get_service_listing_client(service_listing)
    return User.find(service_listing.service_listing_group.client_id)
  end
  
  def get_service_list_client_rating(service_listing)
    client_id = get_service_listing_client(service_listing).id
    if not Review.where(reviewee_id: client_id).empty?
      return Review.where(reviewee_id: client_id).average(:rating).round(2)
    else
      return -1
    end
  end
  
  def get_service_listing_service(service_listing)
    return Service.find(service_listing.service_listing_group.service_id).name
  end
  
  def get_service_listing_hourly_rate(service_listing)
    return service_listing.service_listing_group.hourly_rate
  end
  
  def get_service_listing_task_date(service_listing)
    return service_listing.task_date
  end
  
end
