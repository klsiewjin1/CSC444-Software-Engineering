class ModifyServiceListings < ActiveRecord::Migration[5.1]
  def change
    drop_table :service_listings
    
    create_table :service_listings do |t|
      t.integer :serviceListingGroupID
      t.date :taskDate
      t.time :startTime
      t.time :estimatedEndTime

      t.timestamps
    end
  end
end
