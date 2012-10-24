class Branch < ActiveRecord::Base
  
  # belongs_to :contest
  # has_many :events
  
  # belongs_to :players, :foreign_key => "player_id" 
  # has_and_belongs_to_many :players
  
  # before_save :update_counters
  
  belongs_to :contest, :class_name => 'Contest', :foreign_key => "contest_id"
  belongs_to :user, :class_name => 'User', :foreign_key =>"user_id"
  belongs_to :player, :class_name => 'Player', :foreign_key =>"player_id",
              :counter_cache => true
  # counter_culture :category
   
  belongs_to :type, :class_name => 'Type', :foreign_key =>"type_id"
  belongs_to :event, :class_name => 'Event', :foreign_key => "event_id"  
  
  attr_accessible :master, :stack_order, :is_player, :is_type, :type_id, :player_id, 
                  :event_id, :user_id, :contest_id, :id, :branch_id, :prev_01, 
                  :prev_02, :prev_03, :prev_04, :prize, :url_address, :sponsor
                  
  def id_to_compare
    if is_player == true && !player_id.nil? then player_id end
    if is_event == true && !event_id.nil? then event_id end
  end
  
  private
  # def update_counters
  #   new_player = Player.find self.player_id
  #   old_player = Player.find self.player_id_was
  #   new_player.increment(:branches_count)
  #   old_player.decrement(:branches_count)
  # end

  
end
