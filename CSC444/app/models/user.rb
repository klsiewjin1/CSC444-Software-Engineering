class User < ApplicationRecord
  validates :type, presence: true
  validates :username, uniqueness:true
  
  has_secure_password
end
