class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = Blog.includes(:user, :category, :tags)
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

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :myblog)
  end
end