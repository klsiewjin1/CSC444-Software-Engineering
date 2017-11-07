module ServiceListingsHelper
  
  NOT_APPLICABLE = 'N/A'
  
  def get_service_listing_client(service_listing)
    return get_user(service_listing.client_id)
  end
  
  def get_service_list_client_rating(service_listing)
    client_id = get_service_listing_client(service_listing).id
    get_avg_rating(client_id)
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
  
  def get_service_listing_approved_teen_name(service_listing_id)
    approval = ServiceListingApproval.all.where(:service_listing_id => service_listing_id, :approved => true).first
    if approval
      teen = get_user(approval.teen_id)
      if teen
        return teen.fname + ' ' + teen.lname
      end
    end
    return NOT_APPLICABLE
  end
  
  def service_listing_vacant(service_listing_id)
    return get_service_listing_approved_teen_name(service_listing_id) == NOT_APPLICABLE
  end

  def get_service_listings_by_user(user_id)
    return ServiceListing.where(client_id: user_id)
  end

  def get_applied_listings_by_teen(teen_id)
    return ServiceListingApproval.where(teen_id: teen_id, approved: false)
  end

  def get_approved_listings_by_teen(teen_id)
    return ServiceListingApproval.where(teen_id: teen_id, approved: true)
  end

  def get_SL_approvals_from_SL(service_listing_id)
    return ServiceListingApproval.where(service_listing_id: service_listing_id, approved: false)
  end
end
