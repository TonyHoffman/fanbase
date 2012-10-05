class Branch < ActiveRecord::Base
  
  # belongs_to :contest
  # has_many :events
  
  # belongs_to :players, :foreign_key => "player_id" 
  # has_and_belongs_to_many :players
  belongs_to :contest, :class_name => 'Contest', :foreign_key => "contest_id"
  belongs_to :user, :class_name => 'User', :foreign_key =>"user_id"
  belongs_to :player, :class_name => 'Player', :foreign_key =>"player_id"
  belongs_to :type, :class_name => 'Type', :foreign_key =>"type_id"
  belongs_to :event, :class_name => 'Event', :foreign_key => "event_id"  
  
  attr_accessible :master, :stack_order, :is_player, :is_type, :type_id, :player_id, 
                  :event_id, :user_id, :contest_id, :id
                  


  
end
