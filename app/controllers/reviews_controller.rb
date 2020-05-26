class ReviewsController < ApplicationController
  before_action :move_to_index
  before_action :set_reviews, only: [:edit, :destroy]

  def create
    review = Review.create(review_params)
    redirect_to blog_path(review.blog.id)
    flash[:notice] = "レビューの投稿が完了しました"
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      redirect_to blog_path(params[:blog_id])
      flash[:notice] = "レビューの編集が完了しました"
    else
      render :edit
      flash[:alert] = "レビューの編集に失敗しました"
    end
  end

  def destroy
    if @review.destroy
      redirect_to blog_path(params[:id])
      flash[:notice] = "レビューの削除が完了しました"
    else
      redirect_to blog_path(params[:id])
      flash[:alert] = "レビューの削除に失敗しました"
    end
  end

  private
  def review_params
    params.require(:review).permit(:body, :article_title, :article_url).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end

  def set_reviews
    @review = Review.find(params[:blog_id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end