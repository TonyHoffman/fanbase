class ContestsController < ApplicationController
  # GET /contests
  # GET /contests.json
  def index
    if !params[:team_id].nil?
      @team = Team.find(params[:team_id])
      @contests = @team.contests     
    else
    @contests = Contest.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contests }
    end
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
    # @team = Team.find(params[:team_id])
    @contest = Contest.find(params[:id])
    @team = @contest.team
    @categories = Category.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@contest] }
    end
  end

  # GET /contests/new
  # GET /contests/new.json
  def new
    @team = Team.find(params[:team_id])
    @contest = Contest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contest }
    end
  end

  # GET /contests/1/edit
  def edit
    @team = Team.find(params[:team_id])    
    @contest = Contest.find(params[:id])
  end

  # POST /contests
  # POST /contests.json
  def create
    @team = Team.find(params[:team_id])
    @contest = @team.contests.build(params[:contest_id])

    respond_to do |format|
      if @contest.update_attributes(params[:contest])
        format.html { redirect_to [@team, @contest], notice: 'Contest was successfully created.' }
        format.json { render json: [@contest], status: :created, location: [@contest] }
      else
        format.html { render action: "new" }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contests/1
  # PUT /contests/1.json
  def update
    # @team = Team.find(params[:team_id])
    @contest = Contest.find(params[:id])
    @team = @contest.team
    if !params[:category_id].nil?
      @category = Category.find(params[:category_id]) 
      @contest.update_attributes(:category_id => @category.id)
    end

    respond_to do |format|
      if @contest.update_attributes(params[:contest])
        format.html { redirect_to [@team, @contest], notice: 'Contest was successfully updated. Yes.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @team = Team.find(params[:team_id])
    @contest = Contest.find(params[:id])
    @contest.destroy

    # @contest = Contest.find(params[:id])
    # @contest.destroy

    respond_to do |format|
      format.html { redirect_to team_contests_url }
      format.json { head :no_content }
    end
  end
  
  
  # def make_contest_category
  #   @category = Category.find(params[:category])
  #   @contest.find(params[:contest_id])
  #   @team = @contest.team
  #   # @contest.category = @category
  #   @contest.update_attributes(:category_id => @category.id)
  #   # @contest = @category.contests.build(params[:contest_id])
  #   
  #   # @contest.save!
  #   
  #   respond_to do |format|
  #      if @contest.update_attributes(params[:contest])
  #        format.html { redirect_to [@team, @contest], notice: 'makeContestCategory was successfully run.' }
  #        format.json { head :no_content }
  #      else
  #        format.html { render action: "edit" }
  #        format.json { render json: @category.errors, status: :unprocessable_entity }
  #      end
  #    end
  # end
  
  
  # def joinable_contests
  #   @contests = Contest.all
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @contests }
  #     # render :layout => 'joinable_contests'
  #     render 'joinable_contests'
  #   end
  # end
  
  
  
end

