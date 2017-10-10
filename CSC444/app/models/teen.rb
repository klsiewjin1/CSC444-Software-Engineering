class Teen < ApplicationRecord
	validates :fname, presence: true, length: { minimum: 2 }
	has_many :reviews
end
