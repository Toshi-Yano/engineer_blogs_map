class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:user, :category)
  end
end