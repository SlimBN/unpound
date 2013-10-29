class TagsController < ApplicationController
  before_filter :find_tag, only: [:show]
  # GET /articles
  # GET /articles.json
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end




private
  def find_tag
    @tag =Tag.find_by_content!(params[:id])
  end



end