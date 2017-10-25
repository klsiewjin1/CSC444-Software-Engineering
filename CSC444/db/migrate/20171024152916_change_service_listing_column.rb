class ChangeServiceListingColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :service_listings, :serviceListingGroupID, :service_listing_group_id
  end
end
