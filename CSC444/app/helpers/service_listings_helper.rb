module ServiceListingsHelper
  
  def get_service_listing_client(service_listing)
    return User.find(service_listing.client_id)
  end
  
  def get_service_list_client_rating(service_listing)
    client_id = get_service_listing_client(service_listing).id
    get_avg_rating(client_id)
  end
  
  def get_service_listing_service(service_listing)
    return Service.find(service_listing.service_id).name
  end
  
  def get_service_listing_hourly_rate(service_listing)
    return service_listing.hourly_rate
  end
  
  def get_service_listing_task_date(service_listing)
    return service_listing.task_date
  end
  
end
