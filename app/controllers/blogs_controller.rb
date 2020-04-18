class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_blogs, only: [:show, :edit]

  def index
    # @blogs = Blog.includes(:user, :category, :tags)
    @person_blogs = Blog.joins(:like_blogs).group(:blog_id).order("count(like_user_id) DESC").where(category_id: "1").limit(10)
    @campany_blogs = Blog.joins(:like_blogs).group(:blog_id).order("count(like_user_id) DESC").where(category_id: "2").limit(10)
    # @person_blogs = Blog.includes(:user, :category, :tags, :like_blogs).order("like_blogs.user_id DESC").where(category_id: "1").limit(10)
    # @campany_blogs = Blog.includes(:user, :category, :tags, :like_blogs).order("like_blogs.user_id DESC").where(category_id: "2").limit(10)
    @new_blogs = Blog.includes(:user, :category, :tags, :like_blogs).order("created_at DESC").limit(10)
  end

  def new
    @blog = Blog.new
    # @blog.build_user
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
    @blog = Blog.find(params[:id])
    @user = User.find_by(id: current_user.id)
    # @blog.build_user
    # binding.pry
  end

  def update
    @blog = Blog.find(params[:id])
    # @blog.build_user
    # @user.update!(update_params)
    @blog.update!(update_params)
    # @user = User.find_by(id: current_user.id)
    # @user.update!(update_params_user)
    # binding.pry
    # binding.pry
    # blog.update(update_params)
    # blog.build_user
    # user = User.find(current_user.id)
    # user.build_blog_id
    # binding.pry
    # user.update(blog_params)
    redirect_to blog_path(@blog.id)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to root_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :url, :body, :owner_id, :category_id, tag_ids: [], user_attributes:[:blog_id]).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:blog).permit(:title, :url, :body, :owner_id, :category_id, tag_ids: [], user_attributes:[:id, :blog_id])
  end
  # def update_params
  #   params.require(:blog).permit(:title, :url, :body, :owner_id, :category_id, tag_ids: [])
  # end
  def update_params_user
    params.require(:user).permit(:id, :blog_id, :name, :email, :encrypted_password)
  end
  
  def set_blogs
    @blog = Blog.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end