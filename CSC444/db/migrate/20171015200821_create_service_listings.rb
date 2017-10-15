class CreateServiceListings < ActiveRecord::Migration[5.1]
  def change
    create_table :service_listings do |t|
      t.integer :clientID
      t.integer :serviceID

      t.timestamps
    end
  end
end
