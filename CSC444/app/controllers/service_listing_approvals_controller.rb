#this controller is only needed to be able to create ServiceListingApproval entries

class ServiceListingApprovalsController < ApplicationController
  
  def create
    @service_listing_approval = ServiceListingApproval.new(service_listing_approval_params)
    @service_listing_approval.teen_id = session[:user_id] # model does not have access to session variable
    
    if @service_listing_approval.save
      puts "Service listing approval created!"
    else
      flash[:errors] = @service_listing.errors
    end
    redirect_to controller: 'service_listings'
  end
  
  private
	# The params that a service listing could have. Excludes all other attributes
  def service_listing_approval_params
    params.permit(:service_listing_id)
  end
    
end
