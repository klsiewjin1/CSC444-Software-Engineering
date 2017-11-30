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
        @notifications = Notification.where(receiver_id: @user.id)
    end
    
    def link_to_profile
        @notice = Notification.find(params[:id])
        @notice.update(:read_at => Time.zone.now)
        redirect_to @current_user
    end
    
    def link_to_my_listings
        @notice = Notification.find(params[:id])
        @notice.update(:read_at => Time.zone.now)
        redirect_to listing_users_path
    end
    
    private
        def notification_params
            params.require(:notification).permit(:actor_id, :receiver_id, :action)
        end
end         