class Blogs::SearchesController < ApplicationController
  def index
    @blogs = Blog.search(params[:keyword_blogs])
    # if params[:id].present?
    # @blogs = Tag.find(params[:id]).blog
    # else
    # @blogs = Blog.all
    # end
  end
end