class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all
    @user = current_user

    if user_signed_in?
      visited = Visit.new(ip_address: request.remote_ip, :what => "Home", :user_id => current_user.id)
      visited.save
    else
      visited = Visit.new(ip_address: request.remote_ip, :what => "Home")
      visited.save
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homes }
    end
  end

  def home_tab_articles
    @articles = Article.all

    respond_to do |format|
      format.js { render :action => '../homes/tabs/articles'}
    end
  end


  def home_tab_journals
    @journals = Journal.all

    respond_to do |format|
      format.js { render :action => '../homes/tabs/journals'}
    end
  end


end
