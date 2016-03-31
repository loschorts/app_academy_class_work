# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
#
users = [
User.create(email: 'abc@gmail.com'),
User.create(email: 'bal@gmwlf.com'),
User.create(email: 'ww@3302f0.com'),
User.create(email: 'xxxx@320w.com'),
User.create(email: 'last@gwoa.com')
]
surls = [
ShortenedUrl.create(long_url: "www.google.com", submitted_id: 1),
ShortenedUrl.create(long_url: "www.github.com", submitted_id: 1),
ShortenedUrl.create(long_url: "www.gmail.com", submitted_id: 2),
ShortenedUrl.create(long_url: "www.youtube.com", submitted_id: 3)
]
visits = [
Visit.create!(shortened_url_id: surls[0].id, visitor_id: users[0].id),
Visit.create!(shortened_url_id: surls[1].id, visitor_id: users[0].id),
Visit.create!(shortened_url_id: surls[2].id, visitor_id: users[0].id),
Visit.create!(shortened_url_id: surls[3].id, visitor_id: users[0].id),
Visit.create!(shortened_url_id: surls[0].id, visitor_id: users[1].id),
Visit.create!(shortened_url_id: surls[0].id, visitor_id: users[2].id)
]
tags = [
Tag.create!(topic: "Wow"),
Tag.create!(topic: "Lol"),
Tag.create!(topic: "Aww")
]
