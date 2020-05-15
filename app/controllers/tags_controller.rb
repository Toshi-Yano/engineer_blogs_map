class TagsController < ApplicationController

  def index
    @tags = Tag.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
