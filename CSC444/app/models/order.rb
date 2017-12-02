class Order < ApplicationRecord
  belongs_to :service_listing
  
  attr_accessor :card_number, :card_cvv, :ip_address
  
  validate :validate_card, :on => :create
  
  def purchase
    response = GATEWAY.purchase(price_cents, credit_card, :ip => ip_address)
    
    # Update service listing as paid here...
    
    return response.success?
  end
  
  private
  
  def price_cents
    # TODO: Get order price...
    return 100
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
