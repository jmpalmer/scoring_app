class TeleopScoresController < ApplicationController
  # GET /teleop_scores
  # GET /teleop_scores.json
  def index
    @teleop_scores = TeleopScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teleop_scores }
    end
  end

  # GET /teleop_scores/1
  # GET /teleop_scores/1.json
  def show
    @teleop_score = TeleopScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teleop_score }
    end
  end

  # GET /teleop_scores/new
  # GET /teleop_scores/new.json
  def new
    @teleop_score = TeleopScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teleop_score }
    end
  end

  # GET /teleop_scores/1/edit
  def edit
    @teleop_score = TeleopScore.find(params[:id])
  end

  # POST /teleop_scores
  # POST /teleop_scores.json
  def create
    @teleop_score = TeleopScore.new(params[:teleop_score])

    respond_to do |format|
      if @teleop_score.save
        format.html { redirect_to @teleop_score, notice: 'Teleop score was successfully created.' }
        format.json { render json: @teleop_score, status: :created, location: @teleop_score }
      else
        format.html { render action: "new" }
        format.json { render json: @teleop_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teleop_scores/1
  # PUT /teleop_scores/1.json
  def update
    @teleop_score = TeleopScore.find(params[:id])

    respond_to do |format|
      if @teleop_score.update_attributes(params[:teleop_score])
        format.html { redirect_to @teleop_score, notice: 'Teleop score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teleop_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teleop_scores/1
  # DELETE /teleop_scores/1.json
  def destroy
    @teleop_score = TeleopScore.find(params[:id])
    @teleop_score.destroy

    respond_to do |format|
      format.html { redirect_to teleop_scores_url }
      format.json { head :no_content }
    end
  end
end
