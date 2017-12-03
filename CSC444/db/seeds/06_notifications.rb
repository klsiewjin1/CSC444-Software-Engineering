Notification.delete_all

notifications = []

reviews = Review.all
reviews.each do |review|
  notification_hash = { actor_id: review.reviewer_id, receiver_id: review.reviewee_id, action: "reviewed you", created_at: review.created_at, updated_at: review.updated_at }
  notifications.push(notification_hash)
end

approvals = ServiceListingApproval.all.where(approved: true)
approvals.each do |approval|
  notification_hash = { actor_id: approval.service_listing.user_id, receiver_id: approval.teen_id, action: "approved your application", created_at: approval.updated_at, updated_at: approval.updated_at }
  notifications.push(notification_hash)
end

values = notifications.map{ |n| "(#{n[:actor_id]}, #{n[:receiver_id]}, \'#{n[:action]}\', \'#{n[:created_at].strftime('%Y-%m-%d %H:%M:%S')}\', \'#{n[:updated_at].strftime('%Y-%m-%d %H:%M:%S')}\')" }.join(',')

# PostgreSQL (production)
#ActiveRecord::Base.connection.execute("INSERT INTO notifications (actor_id, receiver_id, action, created_at, updated_at) VALUES #{values}")

# MySQL (development)
ActiveRecord::Base.connection.execute("INSERT INTO notifications (`actor_id`, `receiver_id`, `action`, `created_at`, `updated_at`) VALUES #{values}")

# Elijah -> Replaced below seeding logic because the notifications generated were not realistic data, also writing to db one row at a time is very slow

# notification_from_teen = []
# notification_from_client = []
# notification_hash = {}
# first_client = User.where(user_type: 'client').first
# first_teen = User.where(user_type: 'teenager').first
# users = User.all
 
# users.each do |user|
#     notification_hash[:actor_id] = first_teen.id
#     notification_hash[:receiver_id] = user.id
#     notification_hash[:action] = "reviewed you"
#     notification_from_teen.push(notification_hash)

# created_at = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
# updated_at = created_at;
# values = notification_from_teen.map{ |n| "(#{n[:actor_id]}, #{n[:receiver_id]}, \'#{n[:action]}\', \'#{created_at}\', \'#{updated_at}\')" }.join(',')
# ActiveRecord::Base.connection.execute("INSERT INTO notifications (`actor_id`, `receiver_id`, `action`, `created_at`, `updated_at`) VALUES #{values}")

#     notification_hash[:actor_id] = first_client.id
#     notification_hash[:receiver_id] = user.id
#     notification_hash[:action] = "approved your application"
#     notification_from_client.push(notification_hash)

# values = notification_from_client.map{ |n| "(#{n[:actor_id]}, #{n[:receiver_id]}, \'#{n[:action]}\', \'#{created_at}\', \'#{updated_at}\')" }.join(',')
# ActiveRecord::Base.connection.execute("INSERT INTO notifications (`actor_id`, `receiver_id`, `action`, `created_at`, `updated_at`) VALUES #{values}")

# end