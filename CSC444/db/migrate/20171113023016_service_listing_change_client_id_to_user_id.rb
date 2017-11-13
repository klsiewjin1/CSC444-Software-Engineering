class ServiceListingChangeClientIdToUserId < ActiveRecord::Migration[5.1]
  def change
    rename_column :service_listings, :client_id, :user_id
  end
end
