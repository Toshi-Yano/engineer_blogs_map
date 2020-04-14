class BlogsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @blogs = Blog.includes(:user, :category)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blogs_params)
  end

  private
  def blogs_params
    params.require(:blog).permit(:title, :url, :body)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end