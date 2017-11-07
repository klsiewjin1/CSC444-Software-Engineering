class Notification < ApplicationRecord
    belongs_to :notification_path, polymorphic: true  
end
