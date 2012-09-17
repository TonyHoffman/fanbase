class Team < ActiveRecord::Base
  
  attr_accessible :city
  
  belongs_to :sport
  
  # accepts_nested_attributes_for :players, :contests
  
  
  has_many :players, :dependent => :destroy
  has_many :contests, :dependent => :destroy
  
  validates :city, :presence => true
  
end
