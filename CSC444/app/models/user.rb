class User < ApplicationRecord
  has_many :service_listings, dependent: :destroy
  
  validates :user_type, presence: true
  validates :username, uniqueness: true
  
  validates :fname, presence: true
  validates_format_of :fname, with: /[-_.a-zA-Z0-9]{2,}/i, on: :create
  
  validates :lname, presence: true
  validates_format_of :lname, with: /[-_.a-zA-Z0-9]{2,}/i, on: :create
  
  validates :address, presence: true
  validates_format_of :address, with: /([0-9]+)\s([a-z\s]+)/i, on: :create
  
  validates :state, presence: true
  validates_format_of :state, with: /[a-z\s.]{2,}/i, on: :create
  
  validates :pcode, presence: true
  validates_format_of :pcode, with: /[0-9a-z]{3}\s?[0-9a-z]{2,3}/i, on: :create
  
  validates :city, presence: true
  validates_format_of :city, with: /[a-z\s.]{2,}/i, on: :create
  
  validates :country, presence: true
  validates_format_of :country, with: /[a-z\s.]{2,}/i, on: :create
  
  validates :cellphone, presence: true
  validates_format_of :cellphone, with: /[0-9]{10,}/i, on: :create
  
  validates :bdate, presence: true

  validates :email, uniqueness: true, confirmation: true
  validates :email_confirmation, presence: true
  validates_format_of :email, with: /([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})/i , on: :create
  
  before_save :downcase_email
  before_save :downcase_username
  has_secure_password

  def downcase_email
    self.email.downcase!
  end
  
  def downcase_username
    self.username.downcase!
  end
end
