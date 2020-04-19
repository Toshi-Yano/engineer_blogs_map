class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = Blog.includes(:user, :category, :tags)
    # @blog = Blog.where(url: @user.myblog)
    @blog = Blog.find_by(id: @user.blog_id)
  end

  def edit
    @user = User.find(params[:id])
    @blog = Blog.find_by(url: @user.myblog)
  end

  def update
    if current_user.update!(update_params)
      # binding.pry
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :myblog)
  end

  def update_params
    params.require(:user).permit(:name, :email, :introduction, :myblog, :blog_id, blog_attributes:[:id, :owner_id])
  end
  
end