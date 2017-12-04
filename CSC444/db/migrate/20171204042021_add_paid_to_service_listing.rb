class AddPaidToServiceListing < ActiveRecord::Migration[5.1]
  def change
    add_column :service_listings, :paid, :boolean, default: false
  end
end
