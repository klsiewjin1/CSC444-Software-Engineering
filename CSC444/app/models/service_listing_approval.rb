class ServiceListingApproval < ApplicationRecord
  belongs_to :service_listing
  before_create :set_approved
  
  def set_approved
    self.approved = true # will change to false once we don't immediately approve
  end
  
end
