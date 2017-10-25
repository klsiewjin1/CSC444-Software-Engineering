class CreateServiceListingGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :service_listing_groups do |t|
      t.integer :clientID
      t.integer :serviceID
      t.float :hourlyRate
      t.string :description

      t.timestamps
    end
  end
end
