class LikeBlogsController < ApplicationController
  
  def create
    LikeBlog.create(like_user_id: current_user.id, blog_id: params[:format])
    redirect_to root_path
  end

  def destroy
    @like_blog = LikeBlog.find_by(like_user_id: current_user.id, blog_id: params[:id])
    @blog = Blog.find_by(id: @like_blog.blog_id)
    @like_blog.destroy
    redirect_to root_path
  end
end