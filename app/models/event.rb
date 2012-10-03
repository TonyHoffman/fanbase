class Event < ActiveRecord::Base
  
  attr_accessible :description, :stack_order
  
  belongs_to :type
  # belongs_to :branch
  
  has_many :branches
  
end
