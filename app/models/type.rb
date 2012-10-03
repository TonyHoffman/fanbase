class Type < ActiveRecord::Base
  
  belongs_to :sport

  attr_accessible :event, :stack_order
  
  has_many :events
  has_many :branches
  
  accepts_nested_attributes_for :events
  
  
end
