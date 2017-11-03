class Review < ApplicationRecord
    validates :review, presence: true
    validates :rating, format: { with: /\A[1-5]\z/,
    message: "not valid rating" }
    
end
