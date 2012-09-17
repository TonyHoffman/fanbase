require 'spec_helper'

describe Team do
  
  before(:each) do
    @sport = Sport.create!(:description => "Hockey", :season => "2012-2013")
    @attr = {
      :city => "a"
      }
  end
  
  it "should create a new instance given a valid attribute" do
    @sport.teams.create(@attr)
  end
  
  it "should not have an empty field for a city name" do
    @sport.teams.build(@attr.merge(:city => '')).should_not be_valid
  end
  
  it "should require super-validation before being destroyed" do
    
  end
  
  
end
