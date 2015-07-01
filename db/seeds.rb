# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.delete_all
Interest.delete_all
UserInterest.delete_all

5.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    user_image: Faker::Avatar.image,
    age: rand(10) + 20,
    bio: "I LOVE ANDY'S BACKEND",
    eye_color: Faker::Commerce.color, 
    height: rand(5),
    gender: ['male', 'female'].sample,
    looking_for: "LOVE",
    ethnicity: ["white", "asian", "black", "hispanic", "other"].sample,
    zip_code: Faker::Address.zip,
    location: "San Francisco, CA",
    long: 37.7833,
    lat: -122.4167
    )
end

User.create(
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password(8),
  user_image: Faker::Avatar.image,
  age: rand(10) + 20,
  bio: "IM FROM DENVER",
  eye_color: Faker::Commerce.color, 
  height: rand(5),
  gender: ['male', 'female'].sample,
  looking_for: "LOVE",
  ethnicity: ["white", "asian", "black", "hispanic", "other"].sample,
  zip_code: Faker::Address.zip,
  location: "Denver, Colorado",
  long: 39.7392,
  lat: -104.9903
  )

coding = Interest.create(name:"coding")
hiking = Interest.create(name:"hiking")
dancing = Interest.create(name:"dancing")
meditation = Interest.create(name:"meditation")
sleeping = Interest.create(name:"sleeping")

UserInterest.create(user_id: User.first.id ,interest_id: Interest.first.id)
UserInterest.create(user_id: User.second.id ,interest_id: Interest.second.id)
UserInterest.create(user_id: User.third.id ,interest_id: Interest.third.id)
UserInterest.create(user_id: User.fourth.id ,interest_id: Interest.fourth.id)
UserInterest.create(user_id: User.fifth.id ,interest_id: Interest.fifth.id)
