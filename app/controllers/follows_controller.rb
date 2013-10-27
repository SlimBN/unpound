class FollowsController < ApplicationController
  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @follows }
    end
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
    @follow = Follow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @follow }
    end
  end

  # GET /follows/new
  # GET /follows/new.json
  def new
    @follow = Follow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @follow }
    end
  end

  # GET /follows/1/edit
  def edit
    @follow = Follow.find(params[:id])
  end

  # POST /follows
  # POST /follows.json
  def create
    @follow = Follow.new(params[:follow])

    respond_to do |format|
      if @follow.save
        @followee = User.find(@follow.followee_id)
        format.js { render :action => '../follows/ajax/follow'}
      else
        format.html { render action: "new" }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /follows/1
  # PUT /follows/1.json
  def update
    @follow = Follow.find(params[:id])

    respond_to do |format|
      if @follow.update_attributes(params[:follow])
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    respond_to do |format|
        @followee = User.find(@follow.followee_id)
        format.js { render :action => '../follows/ajax/unfollow'}
    end
  end


  def article_user_follow
    @article = Article.find(params[:id])
    @follow = Follow.new(:user_id => current_user.id, :followee_id => @article.user.id)
    @follow.save

    respond_to do |format|
        format.js { render :action => '../follows/ajax/article_user_unfollow'}
    end
  end


  def article_user_unfollow
    @article = Article.find(params[:id])
    @follow = Follow.where('user_id = ? and followee_id = ?', current_user.id, @article.user.id).last
    @follow.destroy

    respond_to do |format|
        format.js { render :action => '../follows/ajax/article_user_follow'}
    end
    
  end
end
