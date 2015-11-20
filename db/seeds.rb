# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Sub.destroy_all

User.create!(username: "a", password: "password")

5.times do
  user = User.create(username: Faker::Internet.user_name, password: "password")
  puts user
end

5.times do
  sub = Sub.create!(title: Faker::Lorem.word, description: Faker::Lorem.sentence(3), moderator_id: User.find_by(username: "a").id)
  puts sub
end
