# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'bingbong')
User.create(username: 'cat')
User.create(username: 'vacmclenr')
User.create(username: 'LiDdoAznswtee')

Contact.create(name: "Christine", email: "aZNSWeetie@aol.com", user_id: 1)
Contact.create(name: "Ken", email: "vACmLCrR@gmail.com", user_id: 1)
Contact.create(name: "Fred", email: "dude@gmail.com", user_id: 1)

#share "CHristine" contact
ContactShare.create(user_id:2, contact_id: 1) #with Username Cat
ContactShare.create(user_id:3, contact_id: 1) #with Username #vacmclenr

#share "Ken" contact
ContactShare.create(user_id:4, contact_id: 2) #with Username LIDDOZAN
ContactShare.create(user_id:2, contact_id: 2) #with USERNAME Cat

#share "FRED"
ContactShare.create(user_id:2, contact_id: 3) #with USERNAME liddoazn
