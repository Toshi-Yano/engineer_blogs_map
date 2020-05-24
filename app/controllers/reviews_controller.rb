class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:edit, :destroy]

  def create
    review = Review.create(review_params)
    redirect_to blog_path(review.blog.id)
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to blog_path(params[:blog_id])
  end

  def destroy
    @review.destroy
    redirect_to blog_path(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:body, :article_title, :article_url).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end

  def set_reviews
    @review = Review.find(params[:blog_id])
  end

end