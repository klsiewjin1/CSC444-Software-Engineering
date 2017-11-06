class ServiceListingsController < ApplicationController
  def index
    @service_listings = ServiceListing.all
    @service_listing_approvals = ServiceListingApproval.all
  end

  def new
    @service_listing = ServiceListing.new
    @services = Service.all # used for services dropdown
  end

  def show
    @service_listing = ServiceListing.find(params[:id])
  end
  
  def create
    @service_listing = ServiceListing.new(service_listing_params)
    @service_listing.client_id = session[:user_id]
    
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
    	params.require(:service_listing).permit(:service_id, :task_date, :hourly_rate, :description)
  end

end
