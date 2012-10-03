class Sport < ActiveRecord::Base
  
  attr_accessible :description, :season# ,  :team_attributes
  has_many :teams, :dependent => :destroy
  has_many :types, :dependent => :destroy
  
  # accepts_nested_attributes is necessary, I don't really know why
  accepts_nested_attributes_for :teams
  accepts_nested_attributes_for :types
  
  
  # validates :description, :presence => true
  # 
  # validates :season, :presence => true
  
  validates_each  :description,
                  :season,
                  do |record, attr, value|
                    if value.blank?
                      record.errors.add(attr, "can't be blank.")
                    end
                  end 
  end
