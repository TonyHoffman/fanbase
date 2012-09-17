require 'spec_helper'

describe Player do
  
  before(:each) do
    @attr = { :last_name => "a",
              :first_name => "a",
              :first_game => "1",
              :last_game => "1",
              :position => "a"
              }
    @team = Team.create!(:city => "a")
              
  end

  describe "failures" do
    
    it "should have a last name" do
      @team.players.build(@attr.merge(:last_name => "")).should_not be_valid
    end
    
    it "should have a first name" do
      @team.players.build(@attr.merge(:first_name => "")).should_not be_valid
    end
    
    it "should have a first game"do
      @team.players.build(@attr.merge(:first_game => "")).should_not be_valid
    end
    
    it "should have a last game"do
      @team.players.build(@attr.merge(:last_game => "")).should_not be_valid
    end
    
    it "should have a position"do
      @team.players.build(@attr.merge(:position => "")).should_not be_valid
    end
    
    
    
    
  end

  it "should require super-validation before being destroyed"




end
