class LikeBlogsController < ApplicationController
  before_action :logged_in_user
  
  def create
    
  end

  def destroy
    @blog = LikeBlog.find(params[:id]).blog
    @blog.delete_like(current_user)
  end
end