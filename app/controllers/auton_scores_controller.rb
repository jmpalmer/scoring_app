class AutonScoresController < ApplicationController
  # GET /auton_scores
  # GET /auton_scores.json
  def index
    @auton_scores = AutonScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @auton_scores }
    end
  end

  # GET /auton_scores/1
  # GET /auton_scores/1.json
  def show
    @auton_score = AutonScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @auton_score }
    end
  end

  # GET /auton_scores/new
  # GET /auton_scores/new.json
  def new
    @auton_score = AutonScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @auton_score }
    end
  end

  # GET /auton_scores/1/edit
  def edit
    @auton_score = AutonScore.find(params[:id])
  end

  # POST /auton_scores
  # POST /auton_scores.json
  def create
    @auton_score = AutonScore.new(params[:auton_score])

    respond_to do |format|
      if @auton_score.save
        format.html { redirect_to @auton_score, notice: 'Auton score was successfully created.' }
        format.json { render json: @auton_score, status: :created, location: @auton_score }
      else
        format.html { render action: "new" }
        format.json { render json: @auton_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /auton_scores/1
  # PUT /auton_scores/1.json
  def update
    @auton_score = AutonScore.find(params[:id])

    respond_to do |format|
      if @auton_score.update_attributes(params[:auton_score])
        format.html { redirect_to @auton_score, notice: 'Auton score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @auton_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auton_scores/1
  # DELETE /auton_scores/1.json
  def destroy
    @auton_score = AutonScore.find(params[:id])
    @auton_score.destroy

    respond_to do |format|
      format.html { redirect_to auton_scores_url }
      format.json { head :no_content }
    end
  end
end
