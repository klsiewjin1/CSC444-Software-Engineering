ServiceListingApproval.delete_all

teens = User.where(user_type: 'teenager')
client_latlongs = User.where(user_type: 'client').map{ |c| [c.id, { lat: c.lat, long: c.long }] }.to_h
cutoff_date = Date.new(2017, 12, 8)

teens_close_to_clients = {}
approvals = []

listings = ServiceListing.all
listings.each do |l|
  if not teens_close_to_clients.key?(l.user_id)
    if client_latlongs[l.user_id][:lat] != nil and client_latlongs[l.user_id][:long] != nil
      teens_close_to_clients[l.user_id] = teens.select{ |teen| teen.lat == nil or teen.long == nil or (teen.lat - client_latlongs[l.user_id][:lat]).abs + (teen.long - client_latlongs[l.user_id][:long]).abs < 0.005 }
    else
      teens_close_to_clients[l.user_id] = teens
    end
  end
  
  num_approval_entries = [rand(6), teens_close_to_clients[l.user_id].length].min
  selected_approval_index = -1
  if l.task_date < cutoff_date
    selected_approval_index = rand(num_approval_entries)
  end
  
  (0..(num_approval_entries - 1)).each do |i|
    approvals.push({ service_listing_id: l.id, teen_id: teens_close_to_clients[l.user_id][i].id, approved: (i == selected_approval_index) })
  end
end

created_at = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
values = approvals.map{ |a| "(#{a[:service_listing_id]}, #{a[:teen_id]}, #{a[:approved]}, \'#{created_at}\', \'#{created_at}\')" }.join(',')
ActiveRecord::Base.connection.execute("INSERT INTO service_listing_approvals (`service_listing_id`, `teen_id`, `approved`, `created_at`, `updated_at`) VALUES #{values}")

# first_listing = ServiceListing.all.first
# second_listing = ServiceListing.all.second

# first_listing.service_listing_approvals.create([{ service_listing_id: first_listing.id, teen_id: User.all.where(user_type: 'teenager').first.id }])
# second_listing.service_listing_approvals.create([{ service_listing_id: second_listing.id, teen_id: User.all.where(user_type: 'teenager').first.id }])