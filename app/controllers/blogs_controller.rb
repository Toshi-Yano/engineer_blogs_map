class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_blogs, only: [:show, :edit]

  def index
    @person_blogs = Blog.includes(:tags, :blog_tags).joins(:like_blogs).group(:blog_id).order("count(like_user_id) DESC").where(category_id: "1").limit(10)
    @campany_blogs = Blog.includes(:tags, :blog_tags).joins(:like_blogs).group(:blog_id).order("count(like_user_id) DESC").where(category_id: "2").limit(10)
    @new_blogs = Blog.includes(:tags, :blog_tags).order("created_at DESC").limit(10)
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
    @reviews = Review.includes(:tags, :blog_tags).order("created_at DESC").where(blog_id: params[:id]).page(params[:page]).per(10)
    @owner = User.find_by(blog_id: @blog.id)
    @regist_user = User.find_by(id: @blog.user_id)
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update!(update_params)
    redirect_to blog_path(@blog.id)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to root_path
  end

  def search_index
    @q = Blog.ransack(params[:q])
    @tags = Tag.all
    @blogs = @q.result.includes(:tags, :blog_tags)
  end

  def search_show
    @q = Blog.search(search_params)
    @blogs = @q.result.includes(:tags, :blog_tags)
    # binding.pry
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :url, :body, :owner_id, :category_id, tag_ids: [], user_attributes:[:blog_id]).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:blog).permit(:title, :url, :body, :owner_id, :category_id, tag_ids: [], user_attributes:[:id, :blog_id, :_destroy]).merge(user_id: current_user.id)
  end

  def set_blogs
    @blog = Blog.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def search_params
    params.require(:q).permit(:title_cont, :tags_id_in)
  end
end