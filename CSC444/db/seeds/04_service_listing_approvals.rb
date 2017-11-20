ServiceListingApproval.delete_all

teens = User.where(user_type: 'teenager')
client_latlongs = User.where(user_type: 'client').map{ |c| [c.id, { lat: c.lat, long: c.long }] }.to_h
cutoff_date = Date.new(2017, 12, 8)

teens_close_to_clients = {}
# approvals = []

listings = ServiceListing.all
listings.each do |l|
  listing_approvals = []
  if not teens_close_to_clients.key?(l.user_id)
    if client_latlongs[l.user_id][:lat] != nil and client_latlongs[l.user_id][:long] != nil
      teens_close_to_clients[l.user_id] = teens.select{ |teen| teen.lat == nil or teen.long == nil or (teen.lat - client_latlongs[l.user_id][:lat]).abs + (teen.long - client_latlongs[l.user_id][:long]).abs < 0.01 }
    else
      teens_close_to_clients[l.user_id] = teens
    end
  end
  
  num_approval_entries = [rand(3), teens_close_to_clients[l.user_id].length].min # will use rand(6) after MySQL and bulk insert implemented
  selected_approval_index = -1
  if l.task_date < cutoff_date
    selected_approval_index = rand(num_approval_entries)
  end
  
  (0..(num_approval_entries - 1)).each do |i|
    listing_approvals.push({ service_listing_id: l.id, teen_id: teens_close_to_clients[l.user_id][i].id, approved: (i == selected_approval_index) })
    # approvals.push({ service_listing_id: l.id, teen_id: teens_close_to_clients[l.user_id][i].id, approved: (i == selected_approval_index) })
  end
  
  l.service_listing_approvals.create([listing_approvals])
end

# values = approvals.map{ |a| "(#{a[:service_listing_id]}, #{a[:teen_id]}, #al[:approved]})" }.join(',')
# ActiveRecord::Base.connection.execute("INSERT INTO service_listing_approvals (service_listing_id, teen_id, approved) VALUES #{values}")

# first_listing = ServiceListing.all.first
# second_listing = ServiceListing.all.second

# first_listing.service_listing_approvals.create([{ service_listing_id: first_listing.id, teen_id: User.all.where(user_type: 'teenager').first.id }])
# second_listing.service_listing_approvals.create([{ service_listing_id: second_listing.id, teen_id: User.all.where(user_type: 'teenager').first.id }])