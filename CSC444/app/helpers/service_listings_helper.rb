module ServiceListingsHelper
  
  MINUTES_FROM_12AM_TO_12PM = 720 # minutes between 12am and 12pm
  
  def get_service_listing_client(service_listing)
    return get_user(service_listing.user_id)
  end

  def get_service_listing_by_id(service_listing_id)
    return service_listing =  ServiceListing.find_by(id: service_listing_id)  
  end
  
  def get_service_listing_service(service_listing)
    return get_service_name(service_listing.service_id)
  end

  def get_string_for_time(total_minutes)
    ampm = 'AM'
    if total_minutes >= MINUTES_FROM_12AM_TO_12PM
      total_minutes -= MINUTES_FROM_12AM_TO_12PM
      ampm = 'PM'
    end
    
    hour = total_minutes >= 60 ? total_minutes / 60 : 12
    minute = total_minutes % 60
    
    hour_string = hour.to_s
    minute_string = minute >= 10 ? minute.to_s : '0' + minute.to_s
    
    return hour_string + ':' + minute_string + ' ' + ampm
  end
  
  def get_service_listing_start_time_string(service_listing)
    if service_listing.start_time.nil?
      return 'N/A'
    end
    
    return get_string_for_time(service_listing.start_time)
  end
  
  def get_service_listing_end_time_string(service_listing)
    if service_listing.start_time.nil?
      return 'N/A'
    end
    
    return get_string_for_time(service_listing.start_time + service_listing.duration)
  end
  
  def get_service_listing_hourly_rate(service_listing)
    return service_listing.hourly_rate
  end
  
  def get_service_listing_task_date(service_listing)
    return service_listing.task_date
  end

  def get_service_listing_description(service_listing_approval)
    service_listing = ServiceListing.where(id: service_listing_approval.service_listing_id).first
    return service_listing.description
  end
  
  def get_service_listing_description(service_listing)
    return service_listing.description
  end
  
  def service_listing_vacant(service_listing_id)
    return get_service_listing_approved_teen_name(service_listing_id) == NOT_APPLICABLE
  end

  def get_service_listings_by_user(user_id)
    return ServiceListing.where(user_id: user_id)
  end

  def get_applied_listings_by_teen(teen_id)
    return ServiceListingApproval.where(teen_id: teen_id, approved: false)
  end

  def get_approved_listings_by_user(user_id)
    if user_is_teen(@current_user)
      return ServiceListingApproval.where(teen_id: user_id, approved: true)
    elsif user_is_client(@current_user)
      service_listing = ServiceListing.where(user_id: user_id)
      return ServiceListingApproval.where(approved: true, service_listing_id: service_listing.ids)
    end
  end

  def get_SL_approvals_from_SL(service_listing_id)
    return ServiceListingApproval.where(service_listing_id: service_listing_id, approved: false)
  end

  def service_listing_is_approved(service_listing_id)
    service_listings = ServiceListingApproval.where(service_listing_id: service_listing_id)
    # returns true if any service_listing is true
    return service_listings.any? {
        |service_listing| service_listing.approved == true
    }
  end
end
