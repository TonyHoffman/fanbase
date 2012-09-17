
# this automatically creates a user with the following
Factory.define :user do |user|
  user.name "Tony Hoffman"
  user.email  "tony@saywhatgroup.com"
  #user.email f.sequence(:email) { |n| "foo#{n}@example.com" }
  #user.email user.sequence(:email) { |n| "test#{n}@example.com" }
  user.password "bone123"
  user.password_confirmation "bone123" 
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

# Factory.define :micropost do |micropost|
#   micropost.content "Foo bar"
#   micropost.association :user
# end

Factory.define :sport do |sport|
  sport.season {"a"}
  sport.description {"a"}
end

Factory.define :team do |team|
  team.city {"a"}
  team.association :sport
  # team.sport { |a| a.association(:sport)}
end

Factory.define :contest do |contest|
  contest.name {"a"}
  contest.first_game {"1"}
  contest.last_game {"1"}
  contest.start {""}
  contest.end {""} 
  contest.association :team
  # contest.team { |a| a.association(:team) }
end