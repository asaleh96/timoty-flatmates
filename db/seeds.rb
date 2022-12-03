puts "Droping all previous data : househould + user"
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
    birthday_date: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
  user.household_id = households[i.even? ? 0 : 1].id
  user.save!
  puts "#{user.username} has been created!, Household ID= #{user.household.id}, Is_captain? = #{user.is_captain?}"
end
