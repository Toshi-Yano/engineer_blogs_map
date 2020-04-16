class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_blogs, only: [:show, :edit]

  def index
    @blogs = Blog.includes(:user, :category, :tags)
    # @sorted_blogs = @blogs.limit(5).order("count(@blogs.like_blogs.user) DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to root_path
  end

  def show
    @review = Review.new
    @reviews = @blog.reviews.includes(:user)
  end

  def edit
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog.id)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to root_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :url, :body, :category_id, tag_ids: [] ).merge(user_id: current_user.id)
  end

  def set_blogs
    @blog = Blog.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end