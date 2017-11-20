class ServiceListingApproval < ApplicationRecord
  belongs_to :service_listing
  before_create :set_approved
  # validates_uniqueness_of :teen_id, scope: :service_listing_id
  # self.primary_key = :id,:language_id
  # self.primary_key = :teen_id, :service_listing_id

  def set_approved
    if not self.approved # don't want to run with seed file
      self.approved = false
    end
  end
end
