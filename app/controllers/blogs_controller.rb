class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_blogs, only: [:show, :edit]

  def index
    # @blogs = Blog.includes(:user, :category, :tags)
    @person_blogs = Blog.joins(:like_blogs).group(:user_id).order("count(user_id) DESC")
    # @person_blogs = Blog.includes(:user, :category, :tags, :like_blogs).order("like_blogs.user_id DESC").where(category_id: "1").limit(10)
    @campany_blogs = Blog.includes(:user, :category, :tags, :like_blogs).order("like_blogs.user_id DESC").where(category_id: "2").limit(10)
    @new_blogs = Blog.includes(:user, :category, :tags, :like_blogs).order("created_at DESC").limit(10)
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