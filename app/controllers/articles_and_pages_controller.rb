class ArticlesAndPagesController < ApplicationController
  # GET /articles_and_pages
  # GET /articles_and_pages.json
  def index
    @articles_and_pages = ArticlesAndPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles_and_pages }
    end
  end

  # GET /articles_and_pages/1
  # GET /articles_and_pages/1.json
  def show
    @articles_and_page = ArticlesAndPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @articles_and_page }
    end
  end

  # GET /articles_and_pages/new
  # GET /articles_and_pages/new.json
  def new
    @articles_and_page = ArticlesAndPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @articles_and_page }
    end
  end

  # GET /articles_and_pages/1/edit
  def edit
    @articles_and_page = ArticlesAndPage.find(params[:id])
  end

  # POST /articles_and_pages
  # POST /articles_and_pages.json
  def create
    @articles_and_page = ArticlesAndPage.new(params[:articles_and_page])

    respond_to do |format|
      if @articles_and_page.save
        format.js { render :action => '../journals/ajax/get_article'}
      else
        format.html { render action: "new" }
        format.json { render json: @articles_and_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles_and_pages/1
  # PUT /articles_and_pages/1.json
  def update
    @articles_and_page = ArticlesAndPage.find(params[:id])

    respond_to do |format|
      if @articles_and_page.update_attributes(params[:articles_and_page])
        format.html { redirect_to @articles_and_page, notice: 'Articles and page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @articles_and_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles_and_pages/1
  # DELETE /articles_and_pages/1.json
  def destroy
    @articles_and_page = ArticlesAndPage.find(params[:id])
    @articles_and_page.destroy

    respond_to do |format|
      format.html { redirect_to articles_and_pages_url }
      format.json { head :no_content }
    end
  end
end
