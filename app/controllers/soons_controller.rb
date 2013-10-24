class SoonsController < ApplicationController
  # GET /soons
  # GET /soons.json
  def index
    @soons = Soon.all
    visited = Visit.new(:what => "prelaunch page")
    visited.save

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @soons }
    end
  end

  # GET /soons
  # GET /soons.json
  def watch
    @soons = Soon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @soons }
    end
  end

  # GET /soons/1
  # GET /soons/1.json
  def show
    @soon = Soon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @soon }
    end
  end

  # GET /soons/new
  # GET /soons/new.json
  def new
    @soon = Soon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @soon }
    end
  end

  # GET /soons/1/edit
  def edit
    @soon = Soon.find(params[:id])
  end

  # POST /soons
  # POST /soons.json
  def create
    @soon = Soon.new(params[:soon])

    respond_to do |format|
      if @soon.save
        format.js { render :action => '../soons/ajax/newsletter'}
      else
        format.js { render :action => '../soons/ajax/error'}
        # format.html { render action: "new" }
        # format.json { render json: @soon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /soons/1
  # PUT /soons/1.json
  def update
    @soon = Soon.find(params[:id])

    respond_to do |format|
      if @soon.update_attributes(params[:soon])
        format.html { redirect_to @soon, notice: 'Soon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @soon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soons/1
  # DELETE /soons/1.json
  def destroy
    @soon = Soon.find(params[:id])
    @soon.destroy

    respond_to do |format|
      format.html { redirect_to soons_url }
      format.json { head :no_content }
    end
  end
end
