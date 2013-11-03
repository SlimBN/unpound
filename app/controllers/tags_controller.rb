class TagsController < ApplicationController
  before_filter :find_tag, only: [:show]
  # GET /articles
  # GET /articles.json
  def index
    @tags = Tag.all
    @user = current_user


    if user_signed_in?
      visited = Visit.new(ip_address: request.remote_ip, :what => "tags", :user_id => current_user.id)
      visited.save
    else
      visited = Visit.new(ip_address: request.remote_ip, :what => "tags")
      visited.save
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @user = current_user

    if user_signed_in?
      visited = Visit.new(ip_address: request.remote_ip, :what => "tag_show", :user_id => current_user.id)
      visited.save
    else
      visited = Visit.new(ip_address: request.remote_ip, :what => "tag_show")
      visited.save
    end

    
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