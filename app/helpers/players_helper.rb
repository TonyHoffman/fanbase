module PlayersHelper
  
  def contest_if
    if params[:contest_id] then @contest = Contest.find(params[:contest_id]) end
  end
  
  def branch_count_this_contest(player_id, contest_id)
    branches = Branch.find(:all,
                        :conditions => ['player_id =? and contest_id =?',
                        player_id, contest_id])
    branches.count
  end
  
  def players_this_contest
  @players = Player.find(:all, 
                   :conditions => ["team_id = ?", :team_id], 
                   :order => :last_name)
  end
  
  
  
end
