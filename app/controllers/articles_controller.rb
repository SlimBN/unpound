class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_article, only: [:show, :edit, :update, :destroy]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @user = @article.user

    if user_signed_in?

      is_read =  Read.all(:conditions => ['user_id = ? AND article_id = ?', current_user.id, @article.id]).count

      read_it = Read.new(:user_id => current_user.id, :article_id => @article.id)
      read_it.save

    end

    #@article.trigger_view_event


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @user = current_user
    if @article.user != current_user
      redirect_to @article
    end
    
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        @article.process_tags(@article.id)
        @publication = Publication.new(:user_id => current_user.id, :article_id => @article.id, :element => "article")
        @publication.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    

    respond_to do |format|
      if @article.update_attributes(params[:article])
        @article.process_tags(@article.id)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @publication = Publication.where("user_id = ? and article_id = ?", @article.user_id, @article.id).last
    @publication.destroy
    @article.destroy


    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

private
  def find_article
    @article = Article.find_by_slug!(params[:id])
  end



end
