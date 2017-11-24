module ServiceListingsHelper
  
  def get_service_listing_client(service_listing)
    return get_user(service_listing.user_id)
  end
  
  def get_service_listing_by_id(service_listing_id)
    return service_listing =  ServiceListing.find_by(id: service_listing_id)  
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

  def get_approved_listings_by_teen(teen_id)
    return ServiceListingApproval.where(teen_id: teen_id, approved: true)
  end

  def get_approved_listings_by_client(client_id)
    service_listing = ServiceListing.where(user_id: client_id)
    return ServiceListingApproval.where(approved: true, service_listing_id: service_listing.ids)
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
