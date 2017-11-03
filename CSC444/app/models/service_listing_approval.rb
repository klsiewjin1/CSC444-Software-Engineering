class ServiceListingApproval < ApplicationRecord
  belongs_to :service_listing
  after_create :initialize_approved
  
  def initialize_approved
    self.approved = true # will change to false once we don't immediately approve
  end
  
end
