require 'spec_helper'

describe Sport do
  
  before(:each) do
    @attr = {
      :description => "Hockey", 
      :season => "2011-2012" 
      } 
  end
    
  it "should create a new instance given a valid attribute" do
    Sport.create!(@attr)
  end
  
  it "should require a description" do
    sport_no_description = Sport.new(@attr.merge(:description => ""))
    sport_no_description.should_not be_valid
  end
 
  it "should require a season" do
     sport_no_season = Sport.new(@attr.merge(:season => ""))
     sport_no_season.should_not be_valid
   end
   
   it "should require super-validation before being destroyed"
   
  
  
end