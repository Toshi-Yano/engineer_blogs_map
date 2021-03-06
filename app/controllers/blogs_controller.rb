class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search_show]
  before_action :set_blogs, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.includes(:tags, :blog_tags).joins(:like_blogs).group(:blog_id).order("count(like_user_id) DESC").limit(10)
    @new_blogs = Blog.includes(:tags, :blog_tags).order("created_at DESC").limit(10)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to root_path
      flash[:notice] = "ブログの登録が完了しました"
    else
      render :new
      flash[:alert] = "ブログの登録に失敗しました"
    end
  end

  def show
    @review = Review.new
    @reviews = Review.includes(:user).order("created_at DESC").where(blog_id: params[:id]).page(params[:page]).per(10)
    @owner = User.find_by(id: @blog.owner_id)
    @regist_user = User.find_by(id: @blog.user_id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog.id)
      flash[:notice] = "ブログの編集が完了しました"
    else
      render :edit
      flash[:alert] = "ブログの編集に失敗しました"
    end
  end

  def destroy
    if @blog.destroy
      redirect_to root_path
      flash[:notice] = "ブログの削除が完了しました"
    else
      flash[:alert] = "ブログの削除に失敗しました"
    end 
  end

  def search_show
    unless params[:q].blank?
      params[:q]["title_cont_all"] = params[:q]["title_cont_all"].split(/[\p{blank}\s]+/)
      params[:q]["body_cont_all"] = params[:q]["body_cont_all"].split(/[\p{blank}\s]+/)
      @q = Blog.ransack(params[:q])
      @blogs = @q.result.includes(:tags, :blog_tags).page(params[:page]).to_a.uniq
    else
      params[:q] = {sorts: "created_at DESC"}
      @q = Blog.ransack(params[:q])
      @blogs = @q.result.includes(:tags, :blog_tags).limit(30)
    end
    @categories = Category.all
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :url, :body, :category_id, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_blogs
    @blog = Blog.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end