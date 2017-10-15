class ServiceListingsController < ApplicationController
  def index
    @service_listings = ServiceListing.all
  end

  # don't need now, maybe even never (Elijah)
  def new
  end
  
  def create
    @service_listing = ServiceListing.new(service_listing_params)
    @service_listing.save
    
    redirect_to client_path(@service_listing.clientID)
	end
	
	private
	# The params that a service listing could have. Excludes all other attributes
	def service_listing_params
    	params.require(:service_listing).permit(:clientID, :serviceID)
  end

end
