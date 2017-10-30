class ServiceListing < ApplicationRecord
  has_many :service_listing_approvals, dependent: :destroy
  belongs_to :service_listing_group
  
  validates :task_date , presence:true
end
