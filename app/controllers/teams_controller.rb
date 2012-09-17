class TeamsController < ApplicationController

  before_filter :authenticate
  before_filter :authenticate_admin


  # GET /teams
  # GET /teams.json
  def index
    @sport = Sport.find(params[:sport_id])
    @teams = @sport.teams
    # @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @sport = Sport.find(params[:sport_id])
    @team = Team.find(params[:id])
    @players = @team.players

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@team] }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @sport = Sport.find(params[:sport_id])
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @sport = Sport.find(params[:sport_id])
    @team = Team.find(params[:id])
  end 

  # POST /teams
  # POST /teams.json
  def create
    @sport = Sport.find(params[:sport_id])
    @team = @sport.teams.build(params[:team_id])

    respond_to do |format|
      # if @team.save
      if @team.update_attributes(params[:team])
        
        format.html { redirect_to [@sport, @team], notice: 'Team was successfully created.' }
        format.json { render json: [@team], status: :created, location: [@team] }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @sport = Sport.find(params[:sport_id])
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to [@sport, @team], notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @sport = Sport.find(params[:sport_id])
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to sport_teams_url }
      format.json { head :no_content }
    end
  end
end
