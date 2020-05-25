class Blogs::MyblogsController < ApplicationController

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
    @blog.save
    redirect_to user_path(current_user)
    flash[:notice] = "MyBlogの登録が完了しました"
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog[:owner_id] = nil
    @blog.save
    redirect_to user_path(current_user)
    flash[:notice] = "MyBlogの削除が完了しました"
  end

end
