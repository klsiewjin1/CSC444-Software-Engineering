ServiceListing.delete_all

min_service_id = Service.minimum(:id)
num_services = Service.count()
base_date = Date.new(2017, 7, 1)

listings = []
clients = User.where(user_type: 'client')
services = Service.all.map{ |s| [s.id, s.name] }.to_h

clients.each do |client|
  num_client_listings = rand(10)
  
  num_client_listings.times do |num|
    listing_hash = { client_id: client.id, service_id: min_service_id + rand(num_services), task_date: base_date + rand(183).days, 
                     hourly_rate: (rand(21) / 2.0) + 10, start_time: (rand(25) * 30) + 480 }
    listing_hash[:duration] = ((rand(8) + 1) * 30) # tasks are randomly between 30 min and 4 hours (30 minute intervals)
    listing_hash[:description] = 'I need ' + services[listing_hash[:service_id]].downcase
    listings.push(listing_hash)
  end
end

created_at = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
values = listings.map{ |l| "(#{l[:client_id]}, #{l[:service_id]}, \'#{l[:task_date]}\', #{l[:hourly_rate]}, #{l[:start_time]}, #{l[:duration]}, \'#{l[:description]}\', \'#{created_at}\', \'#{created_at}\')" }.join(',')

# PostgreSQL (production)
ActiveRecord::Base.connection.execute("INSERT INTO service_listings (user_id, service_id, task_date, hourly_rate, start_time, duration, description, created_at, updated_at) VALUES #{values}")

# MySQL (development)
# ActiveRecord::Base.connection.execute("INSERT INTO service_listings (`user_id`, `service_id`, `task_date`, `hourly_rate`, `start_time`, `duration`, `description`, `created_at`, `updated_at`) VALUES #{values}")