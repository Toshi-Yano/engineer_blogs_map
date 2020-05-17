class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :move_to_root, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @person_blogs = Blog.includes(:tags, :blog_tags).joins(:like_blogs).where(like_blogs:{like_user_id: current_user.id},category_id: "1")
    @campany_blogs = Blog.includes(:tags, :blog_tags).joins(:like_blogs).where(like_blogs:{like_user_id: current_user.id},category_id: "2")
    @own_blogs = Blog.includes(:tags, :blog_tags).where(owner_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    @blog = Blog.where(owner_id: @user.id)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction)
  end

  def move_to_root
    @user = User.find(params[:id])
    redirect_to root_path unless @user.id == current_user.id
  end
end