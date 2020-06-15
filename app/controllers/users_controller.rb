class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user

  def show
    if user_signed_in?
      @like_blogs = Blog.includes(:tags, :blog_tags).joins(:like_blogs).where(like_blogs:{like_user_id: current_user.id}).page(params[:page]).per(10)
    end
    @own_blogs = Blog.where(owner_id: @user.id)
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
      flash[:notice] = "ユーザー情報を更新しました"
    else
      render :edit
      flash[:alert] = "ユーザー情報の更新に失敗しました"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction)
  end
  
end