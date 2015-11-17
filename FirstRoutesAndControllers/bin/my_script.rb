require 'addressable/uri'
require 'rest-client'

def get_index
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/'
  ).to_s




  puts RestClient.get(url)
end

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: {  username: 'cookiemonster' } }
  )
end

def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{1}"
  ).to_s

  puts RestClient.get(url)
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{1}"
  ).to_s

  puts RestClient.delete(url)
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{1}"
  ).to_s

  puts RestClient.patch(url, {user: {username: 'cookielover'}})
end

begin
puts "get index"

get_index

puts "Create user"

create_user

puts "show user"

show_user

puts "update user"

update_user

puts "create contact share"

ContactShare.create!(user_id: 1, contact_id: 2)

puts "destroy user"

destroy_user

puts "Contact.all"

puts Contact.all

rescue RestClient::UnprocessableEntity
  puts 'Bad save'
end
