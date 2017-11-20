ServiceListing.delete_all

min_service_id = Service.minimum(:id)
num_services = Service.count()
base_date = Date.new(2017, 7, 1)

# listings = []
clients = User.where(user_type: 'client')
services = Service.all.map{ |s| [s.id, s.name] }.to_h

clients.each do |client|
  client_listings = []
  num_client_listings = rand(3) # change to rand(10) once MySQL and bulk inserting is implemented
  
  num_client_listings.times do |num|
    listing_hash = { user_id: client.id, service_id: min_service_id + rand(num_services), task_date: base_date + rand(183).days, 
                     hourly_rate: (rand(21) / 2.0) + 10, start_time: (rand(25) * 30) + 480 }
    listing_hash[:end_time] = listing_hash[:start_time] + ((rand(8) + 1) * 30)
    listing_hash[:description] = 'I need ' + services[listing_hash[:service_id]].downcase
    # listings.push(listing_hash)
    client_listings.push(listing_hash)
  end
  client.service_listings.create([client_listings])
end

# values = listings.map{ |l| "(#{l[:client_id]}, #{l[:service_id]}, #{l[:task_date]}, #{l[:hourly_rate]}, #{l[:start_time]}, #{l[:end_time]}, #{l[:description]})" }.join(',')
# ActiveRecord::Base.connection.execute("INSERT INTO service_listings (user_id, service_id, task_date, hourly_rate, start_time, end_time, description) VALUES #{values}")

# kanye = User.all.where(fname: 'Kanye').first
# kendrick = User.all.where(fname: 'Kendrick').first

# kanye.service_listings.create([{ user_id: kanye.id, service_id: Service.minimum(:id), hourly_rate: 15.5, description: 'I need babysitting', task_date: Date.new(2017, 10, 7), },
#                               { user_id: kanye.id, service_id: Service.minimum(:id), hourly_rate: 15.5, description: 'I need babysitting', task_date: Date.new(2017, 10, 14) },
#                               { user_id: kanye.id, service_id: Service.minimum(:id), hourly_rate: 15.5, description: 'I need babysitting', task_date: Date.new(2017, 10, 21) }])
                                          
# kendrick.service_listings.create([{ user_id: kendrick.id, service_id: Service.minimum(:id) + 1, hourly_rate: 17.5, description: 'I need yard work', task_date: Date.new(2017, 10, 25) }])