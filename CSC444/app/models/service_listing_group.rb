class ServiceListingGroup < ApplicationRecord
  has_many :service_listings, dependent: :destroy
end
