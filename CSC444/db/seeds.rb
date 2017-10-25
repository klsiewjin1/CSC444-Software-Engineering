# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Service.delete_all
services = Service.create([{ name: 'Babysitting' }, { name: 'Yard Work' }, { name: 'Snow Shovelling' }, { name: 'Furniture Moving' }, { name: 'Simple Cleaning Tasks' }, 
                           { name: 'Vacation Services' }, { name: 'Dog Walking' }, { name: 'Computer Help' }, { name: 'Tutoring' }, { name: 'Reading' }])

ServiceListingGroup.delete_all
service_listing_groups = ServiceListingGroup.create([{ client_id: 1, service_id: Service.minimum(:id), hourly_rate: 15.5, description: 'I need babysitting' }, 
                                                     { client_id: 1, service_id: Service.minimum(:id) + 1, hourly_rate: 17.5, description: 'I need yard work' }])

ServiceListing.delete_all
service_listings = ServiceListing.create([{ service_listing_group_id: ServiceListingGroup.minimum(:id), task_date: Date.new(2017, 10, 7) },
                                          { service_listing_group_id: ServiceListingGroup.minimum(:id), task_date: Date.new(2017, 10, 14) },
                                          { service_listing_group_id: ServiceListingGroup.minimum(:id), task_date: Date.new(2017, 10, 21) },
                                          { service_listing_group_id: ServiceListingGroup.minimum(:id) + 1, task_date: Date.new(2017, 10, 25) }])