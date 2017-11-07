module ServiceListingApprovalsHelper
  
  NOT_APPLICABLE = 'N/A'
  
  def get_service_listing_approved_teen_name(service_listing_id)
    approval = ServiceListingApproval.all.where(:service_listing_id => service_listing_id, :approved => true).first
    if approval
      teen = get_user(approval.teen_id)
      if teen
        return get_user_full_name(teen)
      end
    end
    return NOT_APPLICABLE
  end
  
  def is_service_listing_vacant(service_listing_id)
    return get_service_listing_approved_teen_name(service_listing_id) == NOT_APPLICABLE
  end
  
  # NOTE: need to test below functions (once we implement proper approval process)
  
  # # used for adding/removing approved status
  # def set_approved_status(service_listing_id, teen_id, approved_status)
  #   service_listing_approval_id = ServiceListingApproval.find_by(service_listing_id: service_listing_id, teen_id: teen_id)
  #   if service_listing_approval_id
  #     ServiceListingApprovavl.update(service_listing_approval_id, { approved: approved_status })
  #   end
  # end
  
  # # client approves teen for service listing
  # def add_teen_approval(service_listing_id, teen_id)
  #   set_approved_status(service_listing_id, teen_id, true)
  # end
  
  # # client withdraws approval of teen for service listing
  # def remove_teen_approval(service_listing_id, teen_id)
  #   set_approved_status(service_listing_id, teen_id, false)
  # end
  
end