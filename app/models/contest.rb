class Contest < ActiveRecord::Base
  
  attr_accessible :name, :first_game, :last_game, :start, :end
  attr_accessible :team_id, :category_id
  belongs_to :team, :foreign_key => "team_id"
  belongs_to  :category, :class_name => 'Category', :foreign_key =>"category_id"
  accepts_nested_attributes_for :category
  
  
end
