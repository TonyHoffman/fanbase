module PagesHelper
  
  def player_picks
    @title = 'Player Picks'
    # @contest = Contest.find(params[:contest])
    @team = Team.find(:team_id)
    # @players = @team.players
    @players = Player.find(:all, 
                     :conditions => ["team_id = ?", @team.id], 
                     :order => :last_name)
    
  end
  
  
end
