Notification.delete_all

 notification_from_teen = []
 notification_from_client = []
 notification_hash = {}
 first_client = User.where(user_type: 'client').first
 first_teen = User.where(user_type: 'teenager').first
 users = User.all
 
 users.each do |user|
    notification_hash[:actor_id] = first_teen.id
    notification_hash[:receiver_id] = user.id
    notification_hash[:action] = "reviewed you"
    notification_hash[:notification_path_type] = user.class
    notification_hash[:notification_path_id] = user.id
    notification_from_teen.push(notification_hash)

created_at = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
updated_at = created_at;
values = notification_from_teen.map{ |n| "(#{n[:actor_id]}, #{n[:receiver_id]}, \'#{n[:action]}\', \'#{n[:notification_path_type]}\', \'#{n[:notification_path_id]}\', \'#{created_at}\', \'#{updated_at}\')" }.join(',')
ActiveRecord::Base.connection.execute("INSERT INTO notifications (`actor_id`, `receiver_id`, `action`, `notification_path_type`, `notification_path_id`, `created_at`, `updated_at`) VALUES #{values}")

    notification_hash[:actor_id] = first_client.id
    notification_hash[:receiver_id] = user.id
    notification_hash[:action] = "approved your application"
    notification_hash[:notification_path_type] = user.listing
    # notification_hash[:notification_path_id] = 
    notification_from_client.push(notification_hash)

values = notification_from_client.map{ |n| "(#{n[:actor_id]}, #{n[:receiver_id]}, \'#{n[:action]}\', \'#{n[:notification_path_type]}\', \'#{created_at}\', \'#{updated_at}\')" }.join(',')
ActiveRecord::Base.connection.execute("INSERT INTO notifications (`actor_id`, `receiver_id`, `action`, `notification_path_type`, `created_at`, `updated_at`) VALUES #{values}")

end