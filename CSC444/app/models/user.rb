class User < ApplicationRecord
  validates :usertype, presence: true
  validates :username, uniqueness:true
  
  has_secure_password
end
