class CreateServiceListingApprovals < ActiveRecord::Migration[5.1]
  def change
    create_table :service_listing_approvals do |t|
      t.integer :serviceListingID
      t.integer :teenID
      t.boolean :approved

      t.timestamps
    end
  end
end
