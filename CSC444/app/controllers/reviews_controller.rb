# Handles review access
class ReviewsController < ApplicationController
  include ReviewsHelper
  
  def new
  end

  def create
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
  end
end
