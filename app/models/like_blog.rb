class LikeBlog < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :user_id, presence: true
  validates :blog_id, presence: true

  def add_like
    @like = LikeBlog.create(user_id: current_user.id, blog_id: params[:blog_id])
    @blog = LikeBlog.find(id: @like.blog_id)
    @like_count = Like.where(blog_id: params[:blog_id]).count
  end

  def delete_like
    LikeBlog.findby(user_id: user.id).destroy
  end
end