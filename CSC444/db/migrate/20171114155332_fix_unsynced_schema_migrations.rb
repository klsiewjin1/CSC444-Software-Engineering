class FixUnsyncedSchemaMigrations < ActiveRecord::Migration[5.1]
  def change
    
    # use underscores instead of camel case
    rename_column :service_listings, :serviceListingGroupID, :service_listing_group_id
    rename_column :service_listings, :taskDate, :task_date
    
    # previously created, will add time columns in future after confirming design related to it
    remove_column :service_listings, :startTime
    remove_column :service_listings, :estimatedEndTime
  end
end
