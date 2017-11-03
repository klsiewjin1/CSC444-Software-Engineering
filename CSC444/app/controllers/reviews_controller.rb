# Handles review access
class ReviewsController < ApplicationController
  include ReviewsHelper
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reviewer_id = session[:user_id]
    @user = User.find_by(id: @review.reviewee_id)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @user, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      elsif @review.errors[:review].any?
        format.html { redirect_to @user, notice: 'Review text cannot be empty' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      elsif @review.errors[:rating].any?
        format.html { redirect_to @user, notice: 'Not a valid rating. Must be a integer from 1-5' }
        format.json { render json: @user.errors, status: :unprocessable_entity }  
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @user = User.find(session[:user_id])
    @review_match = get_user_reviews(@user.id)
    @rating = get_avg_rating(@user.id)
  end

  def show
    @review = Review.find(params[:id])
  end

  private
    def review_params
      params.require(:review).permit(:review, :rating, :reviewee_id, :reviewer_id)
    end
end
