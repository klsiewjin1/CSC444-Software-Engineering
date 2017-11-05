class MergeServiceListingTables < ActiveRecord::Migration[5.1]
  def change
    add_column :service_listings, :client_id, :integer
    add_column :service_listings, :service_id, :integer
    add_column :service_listings, :hourly_rate, :float
    add_column :service_listings, :description, :string
  end
end
