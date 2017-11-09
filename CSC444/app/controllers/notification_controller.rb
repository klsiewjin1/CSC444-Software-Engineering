class NotificationController < ApplicationController
    def create
        @notification = Notification.new(notification_params)
        if @notification.save
            puts "done"
        elsif @notification.errors[:error] 
            flash[:error] = "didnt complete"
            redirect_to @user
    end 
end

    private
        def notification_params
            params.require(:notification).permit(:actor_id, :receiver_id, :action, :notification_path)
        end
end         