class Category < ActiveRecord::Base
  
  attr_accessible :level1, :level2, :level3, :level4, :id
  has_many :contests
  
  CATEGORY1CHOICES = ['Touchdown', 'Goal']
  CATEGORYCHOICES = ['Assist', 'When', 'Situation', 'Yardage']
  HOCKEYCATEGORYCHOICES = ['Assist', 'When', 'Situation']
  FOOTBALLCATEGORYCHOICES = ['When', 'Situation','Yardage']
  
end
