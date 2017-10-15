class User < ApplicationRecord
  validates :type, presence: true
  validates :username, uniqueness:true
end
