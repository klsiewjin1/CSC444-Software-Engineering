class RemoveServiceListingGroupId < ActiveRecord::Migration[5.1]
  def change
    remove_column :service_listings, :service_listing_group_id
  end
end
