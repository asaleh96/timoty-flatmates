# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Household.destroy_all
User.destroy_all

User.create(
  email: "shahid@gmail.com",
  password: "123456",
  first_name: "Shahid",
  last_name: "Farooq",
  username: "shahid101",
  birthday_date: "1999-01-06"
)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    email: "#{first_name}.#{last_name}@gmail.com",
    password: "123456",
    first_name:,
    last_name:,
    username: first_name + rand(1..100).to_s,
    birthday_date: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
end
