# require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
   require 'faker'
   make_users
   # populate_2012_buffalo_football
 end
end

def make_users
    Rake::Task['db:reset'].invoke
    admin = User.create!( :name => "admin", 
                          :email => "admin@gmail.com",
                          :password => "passwo",
                          :password_confirmation => "passwo")
    admin.toggle!(:admin)              
    #   99.times do |n|
    #     name = Faker::Name.name
    #     email = "example-#{n+1}@railstutorial.org"
    #     password = "password"
    #     User.create!(:name => name,
    #                  :email => email,
    #                  :password => password,
    #                  :password_confirmation => password)
    # end
end

def populate_2012_buffalo_football
  football = Sport.create!(:description => "Football", :season => 2012)
  bills = Team.new(:city => "Buffalo", :sport_id => football.id)
  Player.create!(:last_name=>"Anderson",:first_name=>"Mark", :position=>"DE",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Barnett",:first_name=>"Nick", :position=>"OLB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Bradham",:first_name=>"Nigel", :position=>"LB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Brown",:first_name=>"Colin", :position=>"C",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Byrd",:first_name=>"Jairus", :position=>"FS",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Carrington",:first_name=>"Alex", :position=>"DT",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Chandler",:first_name=>"Scott", :position=>"TE",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Choice",:first_name=>"Tashard", :position=>"RB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Dareus",:first_name=>"Marcell", :position=>"DT",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Dickerson",:first_name=>"Dorin", :position=>"TE/FB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Fitzpatrick",:first_name=>"Ryan", :position=>"QB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Gilmore",:first_name=>"Stephon", :position=>"DB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Glenn",:first_name=>"Cordy", :position=>"OT",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Graham",:first_name=>"T.J.", :position=>"WR",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Hairston",:first_name=>"Chris", :position=>"LT",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Howell",:first_name=>"Delano", :position=>"DB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Jackson",:first_name=>"Fred", :position=>"RB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Jackson",:first_name=>"Tarvaris", :position=>"QB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Johnson",:first_name=>"Spencer", :position=>"DE",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Johnson",:first_name=>"Stevie", :position=>"WR",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Jones",:first_name=>"Donald", :position=>"WR",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Kelsay",:first_name=>"Chris", :position=>"DE",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Levitre",:first_name=>"Andy", :position=>"LG",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Lindell",:first_name=>"Rian", :position=>"K",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Martin",:first_name=>"Ruvell", :position=>"WR",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"McGee",:first_name=>"Terrence", :position=>"CB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"McIntyre",:first_name=>"Corey", :position=>"FB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"McKelvin",:first_name=>"Leodis", :position=>"CB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Moats",:first_name=>"Arthur", :position=>"OLB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Moore",:first_name=>"Kyle", :position=>"DE",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Moorman",:first_name=>"Brian", :position=>"P",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Morrison",:first_name=>"Kirk", :position=>"OLB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Pears",:first_name=>"Erik", :position=>"RT",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Potter",:first_name=>"John", :position=>"K",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Rinehart",:first_name=>"Chad", :position=>"G",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Rogers",:first_name=>"Justin", :position=>"CB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Sanborn",:first_name=>"Garrison", :position=>"LS",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Scott",:first_name=>"Bryan", :position=>"OLB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Searcy",:first_name=>"Da'Norris", :position=>"SS",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Sheppard",:first_name=>"Kelvin", :position=>"ILB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Smith",:first_name=>"Brad", :position=>"QB/WR",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Smith",:first_name=>"Lee", :position=>"TE",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Spiller",:first_name=>"C.J.", :position=>"RB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Thigpen",:first_name=>"Tyler", :position=>"QB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Urbik",:first_name=>"Kraig", :position=>"G",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"White",:first_name=>"Chris", :position=>"OLB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"White",:first_name=>"Johnny", :position=>"RB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Williams",:first_name=>"Aaron", :position=>"CB",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Williams",:first_name=>"Kyle", :position=>"DT",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Williams",:first_name=>"Mario", :position=>"DE",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Wilson",:first_name=>"George", :position=>"SS",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Wood",:first_name=>"Eric", :position=>"C",:first_game=>1, :last_game=>16, :team_id => bills.id)
   Player.create!(:last_name=>"Young",:first_name=>"Sam", :position=>"RT",:first_game=>1, :last_game=>16, :team_id => bills.id)

  end        
                  
                  
                  
                  
                  
                  
                  
                  
    # User.all(:limit => 6).each do |user|
    #   50.times do
    #     user.microposts.create!(:content => Faker::Lorem.sentence(5))
    #     end
    #   end             
                  
                  
