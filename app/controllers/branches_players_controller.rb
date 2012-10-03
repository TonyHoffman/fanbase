class BranchesPlayersController < ApplicationController
  # GET /branches_players
  # GET /branches_players.json
  def index
    @branches_players = BranchesPlayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branches_players }
    end
  end

  # GET /branches_players/1
  # GET /branches_players/1.json
  def show
    @branches_player = BranchesPlayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branches_player }
    end
  end

  # GET /branches_players/new
  # GET /branches_players/new.json
  def new
    @branches_player = BranchesPlayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @branches_player }
    end
  end

  # GET /branches_players/1/edit
  def edit
    @branches_player = BranchesPlayer.find(params[:id])
  end

  # POST /branches_players
  # POST /branches_players.json
  def create
    @branches_player = BranchesPlayer.new(params[:branches_player])

    respond_to do |format|
      if @branches_player.save
        format.html { redirect_to @branches_player, notice: 'Branches player was successfully created.' }
        format.json { render json: @branches_player, status: :created, location: @branches_player }
      else
        format.html { render action: "new" }
        format.json { render json: @branches_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /branches_players/1
  # PUT /branches_players/1.json
  def update
    @branches_player = BranchesPlayer.find(params[:id])

    respond_to do |format|
      if @branches_player.update_attributes(params[:branches_player])
        format.html { redirect_to @branches_player, notice: 'Branches player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @branches_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches_players/1
  # DELETE /branches_players/1.json
  def destroy
    @branches_player = BranchesPlayer.find(params[:id])
    @branches_player.destroy

    respond_to do |format|
      format.html { redirect_to branches_players_url }
      format.json { head :no_content }
    end
  end
end
