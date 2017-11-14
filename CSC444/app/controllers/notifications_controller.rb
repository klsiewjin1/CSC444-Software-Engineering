class NotificationsController < ApplicationController
    def create
        @notification = Notification.new(notification_params)
        if @notification.save
            puts "done"
        elsif @notification.errors[:error] 
            flash[:error] = "didnt complete"
            redirect_to @user
        end
    end 
    def index
        @user = User.find(session[:user_id])
        @notifications = Notification.where(receiver_id: @user.id).unread
    end
    
    def mark_as_read 
        @user = User.find(session[:user_id])
        @notifications = Notification.where(receiver_id: @user.id).unread
        @notifications.update_all(read_at: Time.zone.now)
        render json: {success: true} 
    end
    
    private
        def notification_params
            params.require(:notification).permit(:actor_id, :receiver_id, :action, :notification_path)
        end
end         