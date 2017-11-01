class DeleteStuff < ActiveRecord::Migration[5.1]
  def change
    drop_table :clients
    drop_table :teens
    remove_column :service_listings, :service_listing_group_id
  end
end
