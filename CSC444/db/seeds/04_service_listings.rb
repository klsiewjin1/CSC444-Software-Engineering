ServiceListing.delete_all

kanye = User.all.where(fname: 'Kanye').first
kendrick = User.all.where(fname: 'Kendrick').first

kanye.service_listings.create([{ user_id: kanye.id, service_id: Service.minimum(:id), hourly_rate: 15.5, description: 'I need babysitting', task_date: Date.new(2017, 10, 7), },
                               { user_id: kanye.id, service_id: Service.minimum(:id), hourly_rate: 15.5, description: 'I need babysitting', task_date: Date.new(2017, 10, 14) },
                               { user_id: kanye.id, service_id: Service.minimum(:id), hourly_rate: 15.5, description: 'I need babysitting', task_date: Date.new(2017, 10, 21) }])
                                          
kendrick.service_listings.create([{ user_id: kendrick.id, service_id: Service.minimum(:id) + 1, hourly_rate: 17.5, description: 'I need yard work', task_date: Date.new(2017, 10, 25) }])