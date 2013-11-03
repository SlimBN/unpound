class BlogsController < ApplicationController
  before_filter :find_blog, only: [:show, :edit, :update, :destroy]
  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all

    if user_signed_in?
      visited = Visit.new(ip_address: request.remote_ip, :what => "blogs", :user_id => current_user.id)
      visited.save
    else
      visited = Visit.new(ip_address: request.remote_ip, :what => "blogs")
      visited.save
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find_by_slug!(params[:id])


    if user_signed_in?
      visited = Visit.new(ip_address: request.remote_ip, :what => "blog_show", :user_id => current_user.id)
      visited.save
    else
      visited = Visit.new(ip_address: request.remote_ip, :what => "blog_show")
      visited.save
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def jdid
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/1/edit
  def baddal

  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update


    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy

    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

private
  def find_blog
    @blog = Blog.find_by_slug!(params[:id])
  end
end
