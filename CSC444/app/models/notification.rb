class Notification < ApplicationRecord
    scope :unread, ->{ where(read_at: nil) } 
end
