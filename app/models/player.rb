class Player < ActiveRecord::Base
  
  attr_accessible :last_name, :first_name, :first_game, :last_game, :position, 
                  :team_id, :id, :branches_count
  
  # attr_accessor :last_first_name
  
  # validates :last_name, first_name, :presence => true
  
  belongs_to :team, :class_name => 'Team', :foreign_key => "team_id"
  has_many :branches
  
  # has_and_belongs_to_many :branches
  
  validates_each  :last_name,
                  :first_name,
                  :first_game,
                  :last_game,
                  :position,
                  do |record, attr, value|
                    if value.blank?
                      record.errors.add(attr, "cannot be blank.")
                    end
                  end
                  
    def player_name
        first_name + ' ' + last_name
      end
      
    def last_first_name
        last_name + ', ' + first_name
      end
      
            
    def branches_count
      branches.count
    end                  
    
    def show_branch_stats
      player_name + ' (' + branches_count.to_s() + ')'
    end
    

                  
  end
