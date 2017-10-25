class DeleteServiceListingTimeColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :service_listings, :start_date
    remove_column :service_listings, :estimated_end_time
  end
end
