class ServiceListing < ApplicationRecord
  has_many :service_listing_approvals, dependent: :destroy
end
