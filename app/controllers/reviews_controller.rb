class ReviewsController < ApplicationController

  def create
    review = Review.create(review_params)
    redirect_to blog_path(review.blog.id)
  end
  
  def edit
    @review = Review.find(params[:blog_id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to blog_path(params[:id])
  end

  def destroy
    review = Review.find(params[:blog_id])
    review.destroy
    redirect_to blog_path(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:body).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end
end