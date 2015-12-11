class Bench < ActiveRecord::Base
	validates :description, :lat, :long, presence: true

	def self.in_bounds(bounds)
		Bench.all.select do |bench|
			bench.lat < bounds["northEast"]["lat"] &&
			bench.lat > bounds["southWest"]["lat"] &&
			bench.long < bounds["northEast"]["long"] &&
			bench.long > bounds["southWest"]["long"]
		end
	end
end
