class Api::BenchesController < ApplicationController
	def index
		@benches = Bench.in_bounds(params[:bounds])
		p "xyz", @benches[0]
	end
	def create
		bench = Bench.new(bench_params)
		render json: bench.errors.full_message unless bench.save
	end

	def bench_params
		params.require(:bench).permit(:lat, :long, :name, :description, :seating)
	end
end
