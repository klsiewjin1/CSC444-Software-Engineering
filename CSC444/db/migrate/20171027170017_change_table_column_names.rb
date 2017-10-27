class ChangeTableColumnNames < ActiveRecord::Migration[5.1]
  def change
    #users
    rename_column :users, :streetnum, :address
    rename_column :users, :usertype, :user_type
    
    #reviews
    rename_column :reviews, :reviewerID, :reviewer_id
    rename_column :reviews, :revieweeID, :reviewee_id
    add_column :reviews, :service_id, :integer
    
    #service_listing_approvals
    rename_column :service_listing_approvals, :serviceListingID, :service_listing_id
    rename_column :service_listing_approvals, :teenID, :teen_id
  end
  
  # users: 
  # reviews:
  # service_listing_approvals:
  
end
