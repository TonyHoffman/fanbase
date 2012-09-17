class PagesController < ApplicationController
  def splash
    @title = 'Splash'
  end

  def home
    @title = 'Home'
  end

  def sports
    @title = 'Sports'
  end

  def teams
    @title = 'Teams'
  end
  
  def admin
    @title = 'Admin'
    @sports = Sport.all
  end
end
