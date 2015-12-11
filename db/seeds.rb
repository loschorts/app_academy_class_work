# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alonggside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Bench.destroy_all

def rand_spot
	lat_min = 37.775051
	lat_max = 37.776679
	long_min = -122.480055
	long_max = -122.442602

	lat = Random.new.rand * (lat_max-lat_min) + lat_min
	long = Random.new.rand * (long_max-long_min) + long_min

	{lat: lat, long: long}

end

50.times do 
	spot = rand_spot
	Bench.create(
		description: "In Honor Of " + Faker::Name.name,
		lat: spot[:lat],
		long: spot[:long]
	)
end