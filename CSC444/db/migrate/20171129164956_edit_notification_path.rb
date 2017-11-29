class EditNotificationPath < ActiveRecord::Migration[5.1]
  def change
        remove_column :notifications, :notification_path_type
        remove_column :notifications, :notification_path_id
  end
end
