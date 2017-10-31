class ServiceListingsController < ApplicationController
  def index
    @service_listings = ServiceListing.all
  end

  # don't need now, maybe even never (Elijah)
  def new
    @service_listing = ServiceListing.new
  end

  def show

  end
  
  # TODO: change this to save both to service_listing and service_listing_group
  def create
    @service_listing = ServiceListing.new(service_listing_params)
    if @service_listing.save
      puts "Service created!"
      redirect_to controller: 'service_listings', notice: 'Job was successfully added.'
    else
      flash[:errors] = @service_listing.errors
      redirect_to action: 'new'
    end
    
#    redirect_to client_path(@service_listing.client_id)
	end
	
	# TODO: modify service_listing_params and create service_listing_group_params
	private
	# The params that a service listing could have. Excludes all other attributes
	def service_listing_params
    	params.require(:service_listing).permit(:service_listing_group_id, :task_date)
  end

end
