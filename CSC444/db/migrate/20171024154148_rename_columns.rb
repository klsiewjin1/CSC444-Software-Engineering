class RenameColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :service_listing_groups, :clientID, :client_id
    rename_column :service_listing_groups, :serviceID, :service_id
    rename_column :service_listing_groups, :hourlyRate, :hourly_rate
    rename_column :service_listings, :taskDate, :task_date
    rename_column :service_listings, :startTime, :start_date
    rename_column :service_listings, :estimatedEndTime, :estimated_end_time
  end
end
