class BranchesController < ApplicationController
  include BranchesHelper
  
  helper_method :sort_column, :sort_direction
  
  def index
    get_parent_contest
    if current_user.admin?
      @branches = @contest.branches.order(sort_column + " " + sort_direction)  
        # @branches.each do |branch|
        #   branch[:last_first_name] = branch.player.last_first_name
        # end
      else 
      @branches = Branch.find(:all, 
                          :conditions => ["contest_id =? and user_id = ?", 
                          params[:contest_id], current_user.id])
      end
    respond_to do |format|
      format.html # index.html.erb
      format.mobile
      format.json { render json: @branches }
    end
  end
  # GET /branches/1
  # GET /branches/1.json
  def show
    get_parent_contest
    get_this_branch

    respond_to do |format|
      format.html # show.html.erb
      format.mobile
      format.json { render json: [@branch] }
    end
  end

  # GET /branches/new
  # GET /branches/new.json
  def new
    get_parent_contest
    # get_live_master_branch
    @branch = Branch.new(attr_for_join_branch)
    # set_branch_ids
    respond_to do |format|
      format.mobile      
      format.html # new.html.erb
      format.json { render json: @branch }
    end
  end

  # GET /branches/1/edit
  def edit
    get_parent_contest
    get_this_branch
  end

  # POST /branches
  # POST /branches.json
  def create
    @contest = get_parent_contest
    @branch = @contest.branches.build(params[:branch_id])
    # @branch.update_attributes(:contest_id => :contest)
    # write_invisible_branch_attributes
    respond_to do |format|
      if @branch.update_attributes(params[:branch])
        # format.js 
        format.html { redirect_to [@contest, @branch], notice: 'Branch was successfully created.' }
        format.mobile { redirect_to [@contest, @branch], notice: 'Branch was successfully created.' }
        format.json { render json: [@branch], status: :created, location: [@branch] }
      else
        format.html { render action: "new" }
        format.mobile { render action: "new" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /branches/1
  # PUT /branches/1.json
  def update
    get_parent_contest
    get_this_branch

    respond_to do |format|
      if @branch.update_attributes(params[:branch])
        format.html { redirect_to [@contest, @branch], notice: 'Branch was successfully updated.' }
        format.mobile { redirect_to [@contest, @branch], notice: 'Branch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.mobile { render action: "edit" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    get_parent_contest
    get_this_branch
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to contest_branches_url }
      format.mobile { redirect_to contest_branches_url }
      format.json { head :no_content }
    end
  end


  private
  def sort_column
    params[:sort] || "player_id"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end

end
