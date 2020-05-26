class Blogs::MyblogsController < ApplicationController
  before_action :move_to_index

  def index
    @blogs = Blog.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
  end

  def create
    @blog = Blog.find_by(url: params[:url])
    @blog[:owner_id] = current_user.id
    if @blog.save
      redirect_to user_path(current_user)
      flash[:notice] = "MyBlogの登録が完了しました"
    else
      render :new
      flash[:alert] = "MyBlogの登録に失敗しました"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog[:owner_id] = nil
    if @blog.save
      redirect_to user_path(current_user)
      flash[:notice] = "MyBlogの削除が完了しました"
    else
      redirect_to user_path(current_user)
      flash[:alert] = "MyBlogの削除に失敗しました"
    end
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
