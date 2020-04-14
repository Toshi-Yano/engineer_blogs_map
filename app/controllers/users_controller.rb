class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @introduction = user.introduction
    @myblog = user.myblog
  end

  def edit
    @user = User.find(params[:id])
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