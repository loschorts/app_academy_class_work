# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

Band.destroy_all
Album.destroy_all
Track.destroy_all
Note.destroy_all

User.create!(email: "ken", password: "ken")

50.times do
  User.create!(email: Faker::Internet.email, password: "password")
end

20.times do
  band = Band.create!(name: Faker::Company.name)
  ["studio", "live"].each do |record_type|
    5.times do
      album = Album.create!(
      name: Faker::Company.buzzword,
      band_id: band.id,
      recorded: record_type)

      10.times do
        Track.create!(
        name: Faker::Company.catch_phrase,
        album_id: album.id)
      end

      2.times do
        Track.create!(
        name: Faker::Company.catch_phrase,
        album_id: album.id,
        bonus: true)
      end

    end
  end
end

10.times do

  user_id = User.first.id
  track_id = Track.first.id
  note = Faker::Lorem.paragraphs
  Note.create!(user_id: user_id, track_id: track_id, note: note)
end
