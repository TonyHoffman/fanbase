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
  
  def get_contest_user_branches
    @user_branches = Branch.find(:all, 
                     :conditions => ["user_id = ? and contest_id =?", current_user.id, 
                     params[:contest_id]], :order => :stack_order)
  end

  def get_live_master_branch
    master_branches = Branch.find(:all, 
                        :conditions => ["master = ? and contest_id =?", true, 
                        params[:contest_id]], :order => :stack_order)
    if !master_branches.empty? then
      if @last_live_user_branch.nil? then
        @live_master_branch = master_branches[0]
        else
        if @user_branches.count < master_branches.count then p = @user_branches.count else p = master_branches.count - 1 end
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

  def show_odds_this_branch(contest_id, stack_order, player_id, event_id, prev_01, prev_02, prev_03)
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
      count = same_branches.count-1
      pluralize(count.to_s(), ' other') 
      end
  end
  
  def get_this_master_branch(contest_id, stack_order)
    prize_branch = Branch.find(:all,
                              :conditions => ["contest_id =? and stack_order =? and master =?",
                                              contest_id, stack_order, 'true'], 
                              :order => :stack_order)[0]
  end
  
  
  def show_next_branch_prize(contest_id, user_id)
    stack_order = Branch.find(:all,
                              :conditions => ["contest_id =? and user_id =?",
                                              contest_id, user_id], 
                              :order => :stack_order).last.stack_order
    next_prize = Branch.find(:all, 
                              :conditions => ["contest_id =? and stack_order =? and master =?", 
                                        contest_id, stack_order + 1, 'true'])[0]
    if !next_prize.nil? then next_prize.prize.to_s() end
  end
  
  def master_branch_count_this_contest(contest_id)
    master_count = Branch.find(:all,
                              :conditions => ["contest_id =? and master =?",
                                              contest_id, 'true'], 
                              :order => :stack_order).count
  end
  
  
  
end
