class AdministrationsController < ApplicationController
  # GET /administrations
  # GET /administrations.json
  def index
    @administrations = Administration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administrations }
    end
  end


  # GET /administrations/1
  # GET /administrations/1.json
  def blogs
    @blogs = Blog.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration }
    end
  end


  # GET /administrations/1
  # GET /administrations/1.json
  def articles
    @articles = Article.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration }
    end
  end



  # GET /administrations/1
  # GET /administrations/1.json
  def users
    @users = User.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration }
    end
  end



  # GET /administrations/1
  # GET /administrations/1.json
  def publications
    @publications = Publication.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration }
    end
  end

  # GET /administrations/new
  # GET /administrations/new.json
  def new
    @administration = Administration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administration }
    end
  end

  # GET /administrations/1/edit
  def edit
    @administration = Administration.find(params[:id])
  end

  # POST /administrations
  # POST /administrations.json
  def create
    @administration = Administration.new(params[:administration])

    respond_to do |format|
      if @administration.save
        format.html { redirect_to @administration, notice: 'Administration was successfully created.' }
        format.json { render json: @administration, status: :created, location: @administration }
      else
        format.html { render action: "new" }
        format.json { render json: @administration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administrations/1
  # PUT /administrations/1.json
  def update
    @administration = Administration.find(params[:id])

    respond_to do |format|
      if @administration.update_attributes(params[:administration])
        format.html { redirect_to @administration, notice: 'Administration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @administration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrations/1
  # DELETE /administrations/1.json
  def destroy
    @administration = Administration.find(params[:id])
    @administration.destroy

    respond_to do |format|
      format.html { redirect_to administrations_url }
      format.json { head :no_content }
    end
  end
end
