class LikeBlogsController < ApplicationController
  # before_action :logged_in_user

  def create
    @blog = Blog.find(params[:format])
    @like_count = @blog.like_blogs.count + 1
    LikeBlog.create(like_user_id: current_user.id, blog_id: params[:format])

  end

  def destroy
    @blog = Blog.find(params[:id])
    @like_count = @blog.like_blogs.count - 1
    like_blog = LikeBlog.find_by(like_user_id: current_user.id, blog_id: params[:id])
    like_blog.destroy
  end
end