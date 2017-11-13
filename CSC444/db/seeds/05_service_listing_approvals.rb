ServiceListingApproval.delete_all

first_listing = ServiceListing.all.first
second_listing = ServiceListing.all.second

first_listing.service_listing_approvals.create([{ service_listing_id: first_listing.id, teen_id: User.all.where(user_type: 'teenager').first.id }])
second_listing.service_listing_approvals.create([{ service_listing_id: second_listing.id, teen_id: User.all.where(user_type: 'teenager').first.id }])