class ClimbLevelsController < ApplicationController
  # GET /climb_levels
  # GET /climb_levels.json
  def index
    @climb_levels = ClimbLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @climb_levels }
    end
  end

  # GET /climb_levels/1
  # GET /climb_levels/1.json
  def show
    @climb_level = ClimbLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @climb_level }
    end
  end

  # GET /climb_levels/new
  # GET /climb_levels/new.json
  def new
    @climb_level = ClimbLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @climb_level }
    end
  end

  # GET /climb_levels/1/edit
  def edit
    @climb_level = ClimbLevel.find(params[:id])
  end

  # POST /climb_levels
  # POST /climb_levels.json
  def create
    @climb_level = ClimbLevel.new(params[:climb_level])

    respond_to do |format|
      if @climb_level.save
        format.html { redirect_to @climb_level, notice: 'Climb level was successfully created.' }
        format.json { render json: @climb_level, status: :created, location: @climb_level }
      else
        format.html { render action: "new" }
        format.json { render json: @climb_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /climb_levels/1
  # PUT /climb_levels/1.json
  def update
    @climb_level = ClimbLevel.find(params[:id])

    respond_to do |format|
      if @climb_level.update_attributes(params[:climb_level])
        format.html { redirect_to @climb_level, notice: 'Climb level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @climb_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climb_levels/1
  # DELETE /climb_levels/1.json
  def destroy
    @climb_level = ClimbLevel.find(params[:id])
    @climb_level.destroy

    respond_to do |format|
      format.html { redirect_to climb_levels_url }
      format.json { head :no_content }
    end
  end
end
