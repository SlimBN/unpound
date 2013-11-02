class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all
    @user = current_user

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
