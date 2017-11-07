module ServiceListingsHelper
  
  def get_service_listing_client(service_listing)
    return get_user(service_listing.client_id)
  end
  
  def get_service_listing_service(service_listing)
    return get_service_name(service_listing.service_id)
  end
  
  def get_service_listing_hourly_rate(service_listing)
    return service_listing.hourly_rate
  end
  
  def get_service_listing_task_date(service_listing)
    return service_listing.task_date
  end
  
  def get_service_listing_description(service_listing)
    return service_listing.description
  end
end
