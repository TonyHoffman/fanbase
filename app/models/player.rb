class Player < ActiveRecord::Base
  
  attr_accessible :last_name, :first_name, :first_game, :last_game, :position
  
  # validates :last_name, first_name, :presence => true
  
  belongs_to :team
  
  validates_each  :last_name,
                  :first_name,
                  :first_game,
                  :last_game,
                  :position,
                  do |record, attr, value|
                    if value.blank?
                      record.errors.add(attr, "cant be blank.")
                    end
                  end
  end
