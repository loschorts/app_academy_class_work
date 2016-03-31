class Bench < ActiveRecord::Base
	validates :description, :lat, :long, presence: true

	def self.in_bounds(bounds)
		Bench.all.select do |bench|
			bench.lat < bounds["northEast"]["lat"].to_f &&
			bench.lat > bounds["southWest"]["lat"].to_f &&
			bench.long < bounds["northEast"]["lng"].to_f &&
			bench.long > bounds["southWest"]["lng"].to_f
		end
	end
end
