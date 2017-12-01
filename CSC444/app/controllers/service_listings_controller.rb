class ServiceListingsController < ApplicationController
  include NotificationsHelper
  include ReviewsHelper
  include ServicesHelper
  include ServiceListingsHelper
  
  def index
    # @service_listings = ServiceListing.all
    # @service_listing_approvals = ServiceListingApproval.all
    @service_listings = ServiceListing.page(params[:page]).per(25)    
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
    @service_listing.user_id = session[:user_id]
    
    if @service_listing.save
      puts "Service listing created!"
      redirect_to controller: 'service_listings', notice: 'Job was successfully added.'
    else
      flash[:errors] = @service_listing.errors
      redirect_to action: 'new'
    end
#    redirect_to client_path(@service_listing.user_id)
	end

  def update
    @service_listing = ServiceListing.find(params[:id])
    if @service_listing.update(service_listing_params)
      flash[:success] = "Updated!"
      render "show"
    else 
      flash[:errors] = @service_listing.errors
    end
  end

  def destroy
    if ServiceListing.find(params[:id]).destroy
      flash[:success] = "Removed job"
      redirect_to listing_users_path
    else
      flash[:errors] = "Failed"
      redirect_to listing_users_path
    end
  end

  # return 
  def nearme
    msg = nil
    status = 200
    if params[:radius] == nil
      status = 500
      msg = { :errorMessage => "No \"radius\" parameter passed!"};
    else
        if validateNearMeParams(params[:radius]) < 0
          status = 500
          msg = { :errorMessage => "Radius must be between 1 and 10 km (inclusive)."};
        end
    end

    respond_to do |format|
      if !msg
        msg = { :radius => "#{params[:radius]}", :userId => current_user.id, 
        :myLat => current_user.lat, :myLon => current_user.long, 
        :listings => get_listings_near_me(params[:radius])};
      end
      response.headers["Access-Control-Allow-Origin"] = "*"
      format.json {render :json => JSON.pretty_generate(msg) , :status => status}
    end
  end

  def mapView
    @current_user = current_user;
  end
	
	private

  def validateNearMeParams(radius)
    if radius.to_i < 1 || radius.to_i > 100
      return -1;
    end

    return 0;
  end

  #dummy
  def get_listings_near_me_d(radius)
    res = []

    clients = [1]
    clients.each do |client|
      listing = {}
      listing[:lat] = 43.430136
      listing[:lon] = -79.7470835
      listing[:serviceListingIds] = [1,2,3]
      listing[:clientId] = 1
      res.push(listing)
    end

    return res
  end

  # assume we are a teen if we get here and that radius is valid. Returns an array to return in the response with
  # client listings near you within the radius provided.
  def get_listings_near_me(radius)
    res = []
    clients = get_clients_within_radius(current_user, radius.to_f);
    clients.each do |client|
      listing = {}
      
      listing[:services] = []
      client.service_listings.each do |clientListing|
        if(!service_listing_is_approved(clientListing.id))
          service = {}
          service[:serviceName] = get_service_listing_service(clientListing)
          service[:rate] = clientListing.hourly_rate
          service[:link] = service_listing_path(clientListing.id)
          listing[:services].push(service)
        end
      end
      next if listing[:services].size == 0
      
      listing[:lat] = client.lat
      listing[:lon] = client.long
      listing[:serviceListingIds] = client.service_listings.ids
      
      listing[:clientPage] = user_path(client.id);
      listing[:address] = get_full_address(client)
      listing[:rating] = get_avg_rating(client.id)
      
      res.push(listing)
    end

    return res
  end

	# The params that a service listing could have. Excludes all other attributes
	def service_listing_params
	    # TODO: modify service_listing_params
    	params.require(:service_listing).permit(:service_id, :task_date, :start_time, :duration, :hourly_rate, :description)
  end

end
