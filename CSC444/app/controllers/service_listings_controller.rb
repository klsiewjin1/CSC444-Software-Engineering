class ServiceListingsController < ApplicationController
  def index
  end

  def new
  end
  
  def create
    @service_listing = ServiceListing.new(service_listing_params)
    
    result = @service_listing.save
    
    if result
      redirect_to client_path(@service_listing.clientID)
    else
      redirect_to client_path
    end
	end
	
	private
	# The params that a service listing could have. Excludes all other attributes
	def service_listing_params
    	params.require(:service_listing).permit(:clientID, :serviceID)
  end

end
