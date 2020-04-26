class LikeBlogsController < ApplicationController
  # before_action :logged_in_user
  
  def create
    # like_blog = current_user.like_blogs.build(blog_id: params[:blog_id])
    # like_blog.save

    # @blog = Blog.find(params[:blog_id])
    # @blog.add_like(current_user)
    # redirect_to root_path
    
    # @like_blog = LikeBlog.new(like_user_id: current_user.id, blog_id: params[:format])
    # @like_blog.save!
    LikeBlog.create(like_user_id: current_user.id, blog_id: params[:format])
    # binding.pry
    redirect_to root_path
  end

  def destroy
    @like_blog = LikeBlog.find_by(like_user_id: current_user.id, blog_id: params[:id])
    @blog = Blog.find_by(id: @like_blog.blog_id)
    @like_blog.destroy
    redirect_to root_path
  end

  # private
  # def like_params
  #   params.permit(like_user_id: current_user.id, blog_id: params[:format])
  # end
end