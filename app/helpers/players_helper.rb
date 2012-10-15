module PlayersHelper
  
  def branch_count_this_contest(player_id, contest_id)
    branches = Branch.find(:all,
                        :conditions => ['player_id =? and contest_id =?',
                        player_id, contest_id])
    if !branches.nil? then branches.count else 0 end
  
  end
  
end
