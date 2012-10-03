class Category < ActiveRecord::Base
  
  attr_accessible :level1, :level2, :level3, :level4, :id, 
                  :describer, :stage, :exact, :upto, :branch, :master, :contests
  
  # belongs_to :parent, :foreign_key => "category_id", :class_name => "Category"
  # has_many :categories, :foreign_key => "category_id", :class_name => "Category"
  
  CATEGORY1CHOICES = ['Touchdown', 'Goal']
  CATEGORYCHOICES = ['Assist', 'When', 'Situation', 'Yardage']
  HOCKEYCATEGORYCHOICES = ['Assist', 'When', 'Situation']
  FOOTBALLCATEGORYCHOICES = ['When', 'Situation','Yardage']
  
end
