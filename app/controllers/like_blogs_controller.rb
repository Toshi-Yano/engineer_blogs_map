class LikeBlogsController < ApplicationController
  # before_action :logged_in_user
  
  def create
    # like_blog = current_user.like_blogs.build(blog_id: params[:blog_id])
    # like_blog.save
    @blog = Blog.find(params[:blog_id])
    @blog.add_like(current_user)
    redirect_to root_path
  end

  def destroy
    # @blog = LikeBlog.find(params[:id]).blog
    # @blog.delete_like(current_user)
    # like_blog = LikeBlog.find_by(blog_id: params[:blog_id], user_id: current_user.id)
    # like_blog.destroy
    @blog = LikeBlog.find(params[;id]).blog
    @blog.delete_like(current_user)
  end
end