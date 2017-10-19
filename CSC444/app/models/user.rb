class User < ApplicationRecord
  validates :usertype, presence: true
  validates :username, uniqueness: true


  validates :email, uniqueness: true, confirmation: true
  validates :email_confirmation, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  
  before_save :downcase_email
  has_secure_password

  def downcase_email
    self.email.downcase!
  end
end
