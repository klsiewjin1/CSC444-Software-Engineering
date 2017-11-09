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

  def update
    # find based on service_listing_id and teen_id, set to true
    @service_listing_approval = ServiceListingApproval.find_by_service_listing_id_and_teen_id(params[:service_listing_id], params[:teen_id])
    if @service_listing_approval.update(service_listing_approval_params)
      flash[:success] = "Approved"
      @user = User.find(params[:id])
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
    end
  end
  
  private
	# The params that a service listing could have. Excludes all other attributes
  def service_listing_approval_params
    params.permit(:service_listing_id, :approved)
  end
end
