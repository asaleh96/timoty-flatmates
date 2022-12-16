puts "Droping all previous data : househould + user"
Task.destroy_all
Household.destroy_all
User.destroy_all

# 1. Create! a User (to be Captain) Captain = User.create (fake data) + is_captain = 1

2.times do |i|
  puts "*"
  # 1. Create! a Household + assign Captain to Household (L. 30)

  puts "Creating number ##{i+1} User"
  user = User.create!(
    email: "hello#{i+1}@gmail.com",
    first_name: "John#{i+1}",
    last_name: "Dupon#{i+1}",
    username: "Captain#{i+1}",
    password: "123456",
    is_captain: 1
  )
  puts "User with ID:#{user.id} created, is captain: #{user.is_captain?}"

  puts "Creating number ##{i+1} Household"

  household = Household.create!(
    name: "Household#{i+1}",
    captain: user
  )

  user.household = household
  user.household_id = household.id
  user.save!

  puts "Household #{household.id} created, captain #{household.captain.first_name}"


  puts "______________________________"
end
households = Household.all


# 3. Creating 6 Users

puts "Creating 6 fake users"

6.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new(
    email: "user#{i}@gmail.com",
    password: "123456",
    first_name: first_name,
    last_name: last_name,
    username: "user#{i}",
    birthday_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    earned_points: rand(500..1500)
  )
  user.household_id = households[i.even? ? 0 : 1].id
  user.save!
  puts "#{user.username} has been created!, Household ID= #{user.household.id}, Is_captain? = #{user.is_captain?}"
end

# 4. Creating fake tasks

puts "Creating 1 task for each Household"

task1 = Task.new(
  name: "Clean the kitchen on Wednesday",
  description: "All clean with garbage out",
  due_date: "12/31/2022",
  points: 1000,
  assignee_id: 1,
  creator_id: 1,
  household_id: 1
)
task1.save

puts "#{task1.name} has been created!"

task2 = Task.new(
  name: "Clean the windows on Wednesday",
  description: "Cristal clear or nothing",
  due_date: "12/31/2022",
  points: 1000,
  assignee_id: 2,
  creator_id: 2,
  household_id: 2
)

task2.save
puts "#{task2.name} has been created!"

puts "XXXX the end XXXX"

puts "Seeding our accounts for Shahid, Caroline, Simona & Ahmed"

shahid = User.new(
  email: "shahid@gmail.com",
  password: "123456",
  first_name: "Shahid",
  last_name: "Farroq",
  username: "ShahidF",
  birthday_date: Faker::Date.birthday(min_age: 18, max_age: 65),
  earned_points: rand(500..1500),
  is_captain: true
)
shahid.household_id = households[1].id
shahid.save!
puts "#{shahid.username} has been created!, Household ID= #{shahid.household.id}, Is_captain? = #{shahid.is_captain?}"

caroline = User.new(
  email: "brascaroline64@gmail.com",
  password: "123456",
  first_name: "Caroline",
  last_name: "Bras",
  username: "CarolineB",
  birthday_date: Faker::Date.birthday(min_age: 18, max_age: 65),
  earned_points: rand(500..1500),
  is_captain: false
)
caroline.household_id = households[1].id
caroline.save!
puts "#{caroline.username} has been created!, Household ID= #{caroline.household.id}, Is_captain? = #{caroline.is_captain?}"

simona = User.new(
  email: "simona_barone@hotmail.com",
  password: "123456",
  first_name: "Simona",
  last_name: "Barone",
  username: "SimonaB",
  birthday_date: Faker::Date.birthday(min_age: 18, max_age: 65),
  earned_points: rand(500..1500),
  is_captain: false
)
simona.household_id = households[1].id
simona.save!
puts "#{simona.username} has been created!, Household ID= #{simona.household.id}, Is_captain? = #{simona.is_captain?}"

ahmed = User.new(
  email: "ahmed@gmail.com",
  password: "123456",
  first_name: "Ahmed",
  last_name: "Saleh",
  username: "AhmedS",
  birthday_date: Faker::Date.birthday(min_age: 18, max_age: 65),
  earned_points: rand(500..1500),
  is_captain: false
)
ahmed.household_id = households[1].id
ahmed.save!
puts "#{ahmed.username} has been created!, Household ID= #{ahmed.household.id}, Is_captain? = #{ahmed.is_captain?}"


puts "Creating number our Household"

ourhousehold = Household.create!(
  name: "MainStreet household",
  captain: shahid
)

shahid.household = ourhousehold
shahid.household_id = ourhousehold.id
shahid.save!

puts "Shahid is associated to the household"

caroline.household = ourhousehold
caroline.household_id = ourhousehold.id
caroline.save!

puts "Caroline is associated to the household"

simona.household = ourhousehold
simona.household_id = ourhousehold.id
simona.save!

puts "Simona is associated to the household"

ahmed.household = ourhousehold
ahmed.household_id = ourhousehold.id
ahmed.save!

puts "Ahmed is associated to the household"


cleankitchen = Task.new(
  name: "Clean the kitchen on Wednesday",
  description: "All clean with garbage out",
  due_date: "12/31/2022",
  points: 1500,
  assignee_id: 12,
  creator_id: 9,
  household_id: 3
)
cleankitchen.save!

puts "#{cleankitchen.name} has been created!"

cleanwindows = Task.new(
  name: "Clean the windows on Wednesday",
  description: "Cristal clear or nothing",
  due_date: "12/31/2022",
  points: 1000,
  assignee_id: 11,
  creator_id: 9,
  household_id: 3
)
cleanwindows.save!

puts "#{cleanwindows.name} has been created!"

noshoepolicy = Rule.new(
  name: "No shoes inside",
  household_id: 3
)
noshoepolicy.save!

puts "#{noshoepolicy.name} has been created!"

dontsmokeinside = Rule.new(
  name: "No smoking inside",
  household_id: 3
)
dontsmokeinside.save!

puts "#{dontsmokeinside.name} has been created!"

movienight = Activity.new(
  name: "Movie Night every Wednesday",
  household_id: 3
)
movienight.save!

puts "#{movienight.name} has been created!"
