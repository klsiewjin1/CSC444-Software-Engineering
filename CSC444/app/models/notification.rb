class Notification < ApplicationRecord
    belongs_to :notification_path, polymorphic: true  
    scope :unread, ->{ where(read_at: nil) } 
end
