class ServiceListing < ApplicationRecord
  has_many :service_listing_approvals, dependent: :destroy
  belongs_to :user
  
  validates :hourly_rate, presence: true
  validates :description, presence: true
  
  # parse start time from form into integer (number of minutes past midnight)
  def start_time=(val)
    write_attribute :start_time, (val[4].to_i * 60) + val[5].to_i
  end
  
  # parse end time from form into integer (number of minutes past midnight), subtract start time to get duration
  def duration=(val)
    write_attribute :duration, ((val[4].to_i * 60) + val[5].to_i) - self.start_time
  end
  
end
