class ServiceListing < ApplicationRecord
  has_many :service_listing_approvals, dependent: :destroy
  
  validates :hourly_rate, presence: true
  validates :description, presence: true
end
