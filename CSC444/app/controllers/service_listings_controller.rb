class ServiceListingsController < ApplicationController
  def index
    @service_listings = ServiceListing.all
    @service_listing_approvals = ServiceListingApproval.all
  end

  # don't need now, maybe even never (Elijah)
  def new
    @service_listing = ServiceListing.new
  end

  def show

  end
  
  def create
    @service_listing = ServiceListing.new(service_listing_params)
    if @service_listing.save
      puts "Service listing created!"
      redirect_to controller: 'service_listings', notice: 'Job was successfully added.'
    else
      flash[:errors] = @service_listing.errors
      redirect_to action: 'new'
    end
    
#    redirect_to client_path(@service_listing.client_id)
	end
	
	private
	# The params that a service listing could have. Excludes all other attributes
	def service_listing_params
	    # TODO: modify service_listing_params
    	params.require(:service_listing).permit(:service_listing_group_id, :task_date)
  end

end
