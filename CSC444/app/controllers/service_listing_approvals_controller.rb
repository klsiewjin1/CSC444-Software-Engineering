# this controller is only needed to be able to create ServiceListingApproval entries

# service listing approvals are applications created when a teen applies for a service listing posted by a client
# things to consider:

# 1. multiple teens applying
# in this case, must show the client all the teens who applied and the ability to choose from them
# when the client approves of a teen to take on a listing, the other applications should disappear from view
# when an application is approved, the teen who has gotten approval should show up in his accepted listings
# teens who were not approved should have their applications hidden from view and notified 
# 
# 2. cancellations
# however, if the teen/client decides to cancel the approval/application, the corresponding party must be notified
# and applications should open up again. therefore, rows in the table should not be deleted
# 
# 3. repeatable
# clients are able to set their listings to be repeatable tasks, such as every 2 weeks or so
# 

class ServiceListingApprovalsController < ApplicationController
  include NotificationsHelper 
  include ServiceListingsHelper 
  
  def create
    @service_listing_approval = ServiceListingApproval.new(service_listing_approval_params)
    @service_listing_approval.teen_id = session[:user_id] # model does not have access to session variable
    
    if @service_listing_approval.save
      flash[:success] = "Applied!"
      @service_listing = get_service_listing_by_id(@service_listing_approval.service_listing_id)
      create_notification(@service_listing_approval.teen_id, @service_listing.user_id, "applied for your job")
    else
      flash[:errors] = @service_listing.errors
    end
    redirect_to controller: 'service_listings'
  end

  def update
    # find based on service_listing_id and teen_id, set to true
    @service_listing_approval = ServiceListingApproval.find_by_service_listing_id_and_teen_id(params[:service_listing_id], params[:teen_id])
    if @service_listing_approval.update(service_listing_approval_params)
      flash[:success] = "Updated!"
      @user = User.find(params[:id])
      create_notification(@user.id, @service_listing_approval.teen_id, "approved your application")
      redirect_to listing_users_path
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
