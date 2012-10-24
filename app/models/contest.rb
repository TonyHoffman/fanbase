class Contest < ActiveRecord::Base
  
  attr_accessible :name, :first_game, :last_game, :start, :end, :id, :team_id
  # attr_accessible :team_id, :category_id
  belongs_to :team, :foreign_key => "team_id"
  
  has_many :branches
  has_many :events
  
  # belongs_to  :category, :class_name => 'Category', :foreign_key =>"category_id"
  accepts_nested_attributes_for :branches
  
  def players_count
    
  end

end
