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
    { user: {  email: "gizmo@gizmo.gizmo" } }
  )
end

def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s

  puts RestClient.get(url)
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/4'
  ).to_s

  puts RestClient.delete(url)
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/5'
  ).to_s

  puts RestClient.patch(url, {user: {name: "Gizbo", email: "giz@bo.com"}})
end

begin
# get_index
# create_user
# show_user
# destroy_user
update_user
rescue RestClient::UnprocessableEntity
  puts 'Bad save'
end
