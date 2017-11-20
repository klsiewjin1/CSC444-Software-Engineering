class StartEndTimeForServiceListings < ActiveRecord::Migration[5.1]
  def change
    add_column :service_listings, :start_time, :integer
    add_column :service_listings, :end_time, :integer
  end
end
