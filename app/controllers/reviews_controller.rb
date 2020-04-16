class ReviewsController < ApplicationController
  def create
    review = Review.create(review_params)
    redirect_to blog_path(review.blog.id)
  end

  private
  def review_params
    params.require(:review).permit(:body).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end
end