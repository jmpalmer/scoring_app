class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new
    @teams = Team.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    
    puts " >>> \n\n\n #{params} \n\n\n"
    
    @match = Match.new
    
    @red_alliance = Alliance.new
    @blue_alliance = Alliance.new
    
    @red_alliance.team1_id = params[:matches][:red_team_id1].to_i
    @red_alliance.team2_id = params[:matches][:red_team_id2].to_i
    @red_alliance.team3_id = params[:matches][:red_team_id3].to_i
    
    @blue_alliance.team1_id = params[:matches][:blue_team_id1].to_i
    @blue_alliance.team2_id = params[:matches][:blue_team_id2].to_i
    @blue_alliance.team3_id = params[:matches][:blue_team_id3].to_i
    
    @red_alliance.save
    @blue_alliance.save
    
    @match.red_alliance_id = @red_alliance.id
    @match.blue_alliance_id = @blue_alliance.id
    
    @match.notes = params[:matches][:notes]
    
    @match.save
    
    @red_teleop = TeleopScore.new
    @red_teleop.high = params[:matches][:red_alliance_teleop_high].to_i || 0
    @red_teleop.medium = params[:matches][:red_alliance_teleop_medium].to_i || 0
    @red_teleop.low = params[:matches][:red_alliance_teleop_low].to_i || 0
    @red_teleop.pyramid = params[:matches][:red_alliance_teleop_pyramid].to_i || 0
    @red_teleop.match_id = @match.id
    @red_teleop.alliance_id = @red_alliance.id
    @red_teleop.save
    
    @blue_teleop = TeleopScore.new
    @blue_teleop.high = params[:matches][:blue_alliance_teleop_high].to_i || 0
    @blue_teleop.medium = params[:matches][:blue_alliance_teleop_medium].to_i || 0
    @blue_teleop.low = params[:matches][:blue_alliance_teleop_low].to_i || 0
    @blue_teleop.pyramid = params[:matches][:blue_alliance_teleop_pyramid].to_i || 0
    @blue_teleop.match_id = @match.id
    @blue_teleop.alliance_id = @blue_alliance.id
    @blue_teleop.save
    
    @red_auton = AutonScore.new
    @red_auton.high = params[:matches][:red_alliance_auton_high].to_i || 0
    @red_auton.medium = params[:matches][:red_alliance_auton_medium].to_i || 0
    @red_auton.low = params[:matches][:red_alliance_auton_low].to_i || 0
    @red_auton.match_id = @match.id
    @red_auton.alliance_id = @red_alliance.id
    @red_auton.save
    
    @blue_auton = AutonScore.new
    @blue_auton.high = params[:matches][:blue_alliance_auton_high].to_i || 0
    @blue_auton.medium = params[:matches][:blue_alliance_auton_medium].to_i || 0
    @blue_auton.low = params[:matches][:blue_alliance_auton_low].to_i || 0
    @blue_auton.match_id = @match.id
    @blue_auton.alliance_id = @blue_alliance.id
    @blue_auton.save
    
    @red1_climb = ClimbLevel.new
    @red2_climb = ClimbLevel.new
    @red3_climb = ClimbLevel.new
    
    @red1_climb.team_id = @red_alliance.team1_id
    @red1_climb.match_id = @match.id
    @red1_climb.height = params[:matches][:red_team1_climb].to_i
    @red1_climb.save
    
    @red2_climb.team_id = @red_alliance.team2_id
    @red2_climb.match_id = @match.id
    @red2_climb.height = params[:matches][:red_team2_climb].to_i
    @red2_climb.save
  
    @red3_climb.team_id = @red_alliance.team3_id
    @red3_climb.match_id = @match.id
    @red3_climb.height = params[:matches][:red_team3_climb].to_i
    @red3_climb.save

    @blue1_climb = ClimbLevel.new
    @blue2_climb = ClimbLevel.new
    @blue3_climb = ClimbLevel.new
    
    @blue1_climb.team_id = @blue_alliance.team1_id
    @blue1_climb.match_id = @match.id
    @blue1_climb.height = params[:matches][:blue_team1_climb].to_i
    @blue1_climb.save
    
    @blue2_climb.team_id = @blue_alliance.team2_id
    @blue2_climb.match_id = @match.id
    @blue2_climb.height = params[:matches][:blue_team2_climb].to_i
    @blue2_climb.save
    
    @blue3_climb.team_id = @blue_alliance.team3_id
    @blue3_climb.match_id = @match.id
    @blue3_climb.height = params[:matches][:blue_team3_climb].to_i
    @blue3_climb.save
    
    @red_penalties = Penalty.new
    @red_penalties.match_id = @match.id
    @red_penalties.alliance_id = @red_alliance.id
    @red_penalties.tech_foul = params[:matches][:red_tech_fouls]
    @red_penalties.foul = params[:matches][:red_fouls]
    @red_penalties.save
    
    @blue_penalties = Penalty.new
    @blue_penalties.match_id = @match.id
    @blue_penalties.alliance_id = @blue_alliance.id
    @blue_penalties.tech_foul = params[:matches][:blue_tech_fouls]
    @blue_penalties.foul = params[:matches][:blue_fouls]
    @blue_penalties.save
    
    if !params[:matches][:red_team1_yellow].nil?
      @card = Card.new
      @card.color = "yellow"
      @card.match_id = @match.id
      @card.team_id = @red_alliance.team1_id
      @card.save
    end
    
    if !params[:matches][:red_team2_yellow].nil?
      @card = Card.new
      @card.color = "yellow"
      @card.match_id = @match.id
      @card.team_id = @red_alliance.team2_id
      @card.save
    end
    
    if !params[:matches][:red_team3_yellow].nil?
      @card = Card.new
      @card.color = "yellow"
      @card.match_id = @match.id
      @card.team_id = @red_alliance.team3_id
      @card.save
    end
    
    
    if !params[:matches][:red_team1_red].nil?
      @card = Card.new
      @card.color = "red"
      @card.match_id = @match.id
      @card.team_id = @red_alliance.team1_id
      @card.save
    end
    
    if !params[:matches][:red_team2_red].nil?
      @card = Card.new
      @card.color = "red"
      @card.match_id = @match.id
      @card.team_id = @red_alliance.team2_id
      @card.save
    end
    
    if !params[:matches][:red_team3_red].nil?
      @card = Card.new
      @card.color = "red"
      @card.match_id = @match.id
      @card.team_id = @red_alliance.team3_id
      @card.save
    end
    
    
    
    if !params[:matches][:blue_team1_yellow].nil?
      @card = Card.new
      @card.color = "yellow"
      @card.match_id = @match.id
      @card.team_id = @blue_alliance.team1_id
      @card.save
    end
    
    if !params[:matches][:blue_team2_yellow].nil?
      @card = Card.new
      @card.color = "yellow"
      @card.match_id = @match.id
      @card.team_id = @blue_alliance.team2_id
      @card.save
    end
    
    if !params[:matches][:blue_team3_yellow].nil?
      @card = Card.new
      @card.color = "yellow"
      @card.match_id = @match.id
      @card.team_id = @blue_alliance.team3_id
      @card.save
    end
    
    
    if !params[:matches][:blue_team1_red].nil?
      @card = Card.new
      @card.color = "red"
      @card.match_id = @match.id
      @card.team_id = @blue_alliance.team1_id
      @card.save
    end
    
    if !params[:matches][:blue_team2_red].nil?
      @card = Card.new
      @card.color = "red"
      @card.match_id = @match.id
      @card.team_id = @blue_alliance.team2_id
      @card.save
    end
    
    if !params[:matches][:blue_team3_red].nil?
      @card = Card.new
      @card.color = "red"
      @card.match_id = @match.id
      @card.team_id = @blue_alliance.team3_id
      @card.save
    end
    
    
    redirect_to new_match_path
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end
end
