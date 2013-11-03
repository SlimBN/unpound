class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
    @user = current_user


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favorites }
    end
  end


  def article_favorite_toggle
    @article = Article.find(params[:id])
    @favorites = Favorite.where("article_id = ? AND user_id = ?", @article.id, current_user.id).count

    if @favorites < 1
      @favore = Favorite.new(:user_id => current_user.id, :article_id => @article.id)
      @favore.save

      respond_to do |format|
          format.js { render :action => '../favorites/ajax/article_toggle'}
      end
    else
      @favore = Favorite.where("article_id = ? AND user_id = ?", @article.id, current_user.id).last
      @favore.destroy

      respond_to do |format|
          format.js { render :action => '../favorites/ajax/article_toggle'}
      end
    end


  end



end
