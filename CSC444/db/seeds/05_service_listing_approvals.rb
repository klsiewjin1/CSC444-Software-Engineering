ServiceListingApproval.delete_all
service_listing_approvals = ServiceListingApproval.create([{ service_listing_id: ServiceListing.first.id, teen_id: User.all.where(user_type: 'teen').first.id, approved: true },
                                                           { service_listing_id: ServiceListing.second.id, teen_id: User.all.where(user_type: 'teen').first.id, approved: true }])