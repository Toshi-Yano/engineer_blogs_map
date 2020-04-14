class BlogsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @blogs = Blog.includes(:user, :category)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :url, :body, :category_id, tag_ids: [] ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end