class Order < ApplicationRecord
  belongs_to :service_listing
  has_many :order_transaction
  
  attr_accessor :card_number, :card_cvv, :ip_address
  
  validate :validate_card, :on => :create
  
  def purchase
    response = GATEWAY.purchase(price_cents, credit_card, :ip => ip_address)
    order_transaction.create!(:action => "purchase", :amount => price_cents, :response => response)
    
    if response.success?
      service_listing = ServiceListing.find(service_listing_id)
      service_listing.paid = true
      service_listing.save
    else
      service_listing = ServiceListing.find(service_listing_id)
      service_listing.paid = false
      service_listing.save
      return false
    end
    
  end
  
  private
  
  def price_cents
    service_listing = ServiceListing.find(service_listing_id)
    
    return ((service_listing.hourly_rate * (service_listing.duration / 60)) / 100)
  end
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors[:base] << message
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_cvv,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end
