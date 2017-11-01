module ReviewsHelper
    # for a given user object, compare the user_id of this table to the reviewee of the reviews table
    # return a new collection with the filtered results. 
    def get_user_reviews(user_id)
        review_match = Review.where(reviewee_id: user_id)
        return review_match
    end
    # for a given user, returns float? average of his/her rating
    def get_avg_rating(user_id)
        if not Review.where(reviewee_id: user_id).empty?
            return Review.where(reviewee_id: user_id).average(:rating).round(2)
        else
            return -1
        end
    end

    def get_user_name_by_id(user_id)
        user = User.find(user_id)
        if user.nil?
            return -1
        else
            return user.username
        end
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