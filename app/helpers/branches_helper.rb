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

  def get_user_contest_branches_count
    @t_u_c_branches = Branch.find(:all, 
                         :conditions => ["user_id = ? and contest_id =?", current_user.id, 
                         params[:contest_id]])
    if !@t_u_c_branches.empty?
      # @user_branch = @t_u_c_branches(0)
       @user_limbs = @t_u_c_branches.count
    else
      @user_limbs = 0
    end
  end
  
  def get_next_master_branch
    get_user_contest_branches_count 
    @master_branches = Branch.find(:all, 
                        :conditions => ["master = ? and contest_id =?", true, 
                        params[:contest_id]])
    if !@master_branches.empty?
      @master_branch_limbs = @master_branches.count
      @this_branch = @master_branches[@user_limbs]
    end
    if @this_branch.nil?
      @this_branch = @master_branches.last
    end
  end
  
  def attr_for_join_branch
    if @this_branch.nil?
      attr = {:is_type => true,
              :type_id => 1,
              :is_player => false,
              :stack_order => 1
              }
      else
      attr = {:is_type => @this_branch.is_type,
            :type_id => @this_branch.type_id, 
            :is_player => @this_branch.is_player,
            :stack_order => @this_branch.stack_order
            }
      end
  end

  # def full_branches
  #   if current_user.
  # end
  
  
end
