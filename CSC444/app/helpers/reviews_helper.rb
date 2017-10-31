module ReviewsHelper
    # for a given user object, compare the user_id of this table to the reviewee of the reviews table
    # return a new collection with the filtered results. 
    def get_user_review(user)
        review_match = Review.where(reviewee_id: user.id)
        return review_match
    end
    
    # for a given user, returns float? average of his/her rating
    def get_avg_rating(user)
       review_match = get_user_review(user)
       avg_rating = review_match.avg(:rating) 
       return avg_rating 
    end
    
    def get_all_reviews()
        reviews_all = Review.all
        return reviews_all
    end
    # for given parameters, create a new entry of reviews, returns created (nil if failed)
    def create_review(reviewer_id, reviewee_id, review_text, rating)
        created = Review.create(:reviewer_id => reviewer_id, :reviewee_id => reviewer_id, :review => review_text, :rating => rating) 
        return created
    end
end