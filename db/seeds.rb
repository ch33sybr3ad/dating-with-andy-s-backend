# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    user_image: Faker::Avatar.image("my-own-slug", "50x50"),
    age: rand(10) + 20,
    bio: "I LOVE ANDY'S BACKEND"
    )
end

coding = Interest.create(name:coding)
hiking = Interest.create(name:hiking)
dancing = Interest.create(name:dancing)
meditation = Interest.create(name:meditation)
sleeping = Interest.create(name:sleeping)

UserInterest.create(user_id: 1 ,interest_id: 1)
UserInterest.create(user_id: 2 ,interest_id: 2)
UserInterest.create(user_id: 3 ,interest_id: 3)
UserInterest.create(user_id: 4 ,interest_id: 4)
UserInterest.create(user_id: 5 ,interest_id: 5)
