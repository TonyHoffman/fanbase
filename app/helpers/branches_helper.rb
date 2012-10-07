module BranchesHelper
  
  def get_parent_contest
    @contest = Contest.find(params[:contest_id])
  end
  def get_this_branch
    @branch = Branch.find(params[:id])
  end
  
  def get_all_branches_this_contest
    @branches = Branch.find(:all, 
                            :conditions => ["contest_id =?", params[:contest_id]])
  end

  def get_live_user_branch
    @user_branches = Branch.find(:all, 
                     :conditions => ["user_id = ? and contest_id =?", current_user.id, 
                     params[:contest_id]], :order => :stack_order)
    if !@user_branches.empty?
      @last_live_user_branch = @user_branches.last
     end
  end
  
  def get_live_master_branch
    master_branches = Branch.find(:all, 
                        :conditions => ["master = ? and contest_id =?", true, 
                        params[:contest_id]], :order => :stack_order)
    if !master_branches.empty?
      if @last_live_user_branch.nil?
        @live_master_branch = master_branches[0]
        else
        if master_branches.count < @user_branches.count then p = master_branches.count-1 else p = @user_branches.count end
        @live_master_branch = master_branches[p]
      end
    end
  end
  
  def attr_for_join_branch
    get_live_user_branch 
    get_live_master_branch
    if @live_master_branch.nil?
      @attr = {:is_type => true,
              :type_id => 1,
              :is_player => false,
              :stack_order => 1
              }
    else
      @attr = {:is_type => @live_master_branch.is_type,
              :type_id => @live_master_branch.type_id, 
              :is_player => @live_master_branch.is_player,
              :stack_order => @live_master_branch.stack_order,
              }
    end
    if !@user_branches.empty?
       if !@last_live_user_branch.event_id.nil? then
           @prev = @last_live_user_branch.event_id else @prev = @last_live_user_branch.player_id end
       if @live_master_branch.stack_order == 2 then addto = {:prev_01 => @prev} end
       if @live_master_branch.stack_order == 3 then addto = {:prev_02 => @prev} end
       if @live_master_branch.stack_order == 4 then addto = {:prev_03 => @prev} end
       if !addto.nil? then @attr.merge!(addto) end
    else
      @attr
     end
  end

  def show_odds_this_branch(contest_id, stack_order, player_id, event_id, prev_01, prev_02, prev_03 )
    if stack_order == 1 && !player_id.nil? then
    same_branches = Branch.find(:all, 
                    :conditions => ["contest_id =? and stack_order =? and player_id =?", 
                                    contest_id, stack_order, player_id])    
    end                                
    if stack_order == 2 && !event_id.nil? then
    same_branches = Branch.find(:all, 
                    :conditions => ["contest_id =? and stack_order =? and event_id =? and prev_01 =?", 
                                    contest_id, stack_order, event_id, prev_01])    
    end                                
    if stack_order == 3 && !event_id.nil? then
    same_branches = Branch.find(:all, 
                    :conditions => ["contest_id =? and stack_order =? and event_id =? and prev_01 =? and prev_02 =?", 
                                    contest_id, stack_order, event_id, prev_01, prev_02])    
    end                                
    if stack_order == 4 && !event_id.nil? then
    same_branches = Branch.find(:all, 
                    :conditions => ["contest_id =? and stack_order =? and event_id =? and prev_01 =? and prev_02 =? and prev_03 =?", 
                                    contest_id, stack_order, event_id, prev_01, prev_02, prev_03])    
    end                                
   if !same_branches.nil? then 
     if same_branches.count() == 1 then 'No others' else pluralize(same_branches.count.to_s(), ' other') end
    end
  end
  
  def show_branch_prize(contest_id, user_id)
    stack_order = Branch.find(:all,
                              :conditions => ["contest_id =? and user_id =?",
                                              contest_id, user_id], 
                              :order => :stack_order).last.stack_order
    prize = Branch.find(:all, 
                        :conditions => ["contest_id =? and stack_order =? and master =?", 
                                        contest_id, stack_order, 'true'])[0].prize.to_s()
  end
  
end
