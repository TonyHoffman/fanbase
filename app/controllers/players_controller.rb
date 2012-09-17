class PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  # GET /players
  # GET /players.json
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])
 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @team = Team.find(params[:team_id])    
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.build(params[:player_id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to [@team, @player], notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to [@team, @player], notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to team_players_url }
      format.json { head :no_content }
    end
  end
  
  
  private
  
  def sort_column
    params[:sort] || "last_name"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
  
  
  
  
  
  
  
  
  
end
