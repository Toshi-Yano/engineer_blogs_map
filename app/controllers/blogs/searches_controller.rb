class Blogs::SearchesController < ApplicationController
  def index
    @blogs_searched_by_word = Blog.search(params[:keyword_blogs])
    # if params([:tag_ids]).present?
    # @blogs_searched_by_tags = Blog.tag_search(params[:tag_ids])
    # end
    # if params[:id].present?
    # @blogs = Tag.find(params[:id]).blog
    # else
    # @blogs = Blog.all
    # end
  end
end