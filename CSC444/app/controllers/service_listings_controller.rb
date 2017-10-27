class ServiceListingsController < ApplicationController
  def index
    @service_listings = ServiceListing.all
  end

  # don't need now, maybe even never (Elijah)
  def new
  end
  
  # TODO: change this to save both to service_listing and service_listing_group
  def create
    @service_listing = ServiceListing.new(service_listing_params)
    @service_listing.save
    
    redirect_to client_path(@service_listing.client_id)
	end
	
	# TODO: modify service_listing_params and create service_listing_group_params
	private
	# The params that a service listing could have. Excludes all other attributes
	def service_listing_params
    	params.require(:service_listing).permit(:client_id, :service_id)
  end

end
