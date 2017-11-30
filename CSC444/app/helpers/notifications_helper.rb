module NotificationsHelper
    def create_notification(actor_id, receiver_id, action)
        # for given parameters, create a new entry in notification, returns create notification (nil if failed)
        created = Notification.create(:actor_id => actor_id, :receiver_id => receiver_id, :action => action) 
        return created
    end    
    def get_user_notifications(user_id) 
        notification_matches = Notification.where(receiver_id: user_id)
        return notification_matches
    end
end
