class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :move_to_root, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @person_blogs = Blog.includes(:user, :category, :blog_tags, :tags, :like_blogs, :reviews).joins(:like_blogs).where(like_blogs:{like_user_id: current_user.id},category_id: "1")
    @campany_blogs = Blog.includes(:user, :category, :blog_tags, :tags, :like_blogs, :reviews).joins(:like_blogs).where(like_blogs:{like_user_id: current_user.id},category_id: "2")
    @blog = Blog.where(url: current_user.myblog)
  end

  def edit
    @user = User.find(params[:id])
    @blog = Blog.where(url: @user.myblog)
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :myblog, :blog_id)
  end

  def move_to_root
    @user = User.find(params[:id])
    redirect_to root_path unless @user.id == current_user.id
  end
end