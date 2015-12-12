class Api::BenchesController < ApplicationController
	def index
		@benches = Bench.in_bounds(params[:bounds])
		p "xyz", @benches[0]
	end
end
