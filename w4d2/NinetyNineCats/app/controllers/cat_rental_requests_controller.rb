class CatRentalRequestsController < ApplicationController
  def index
    @requests = CatRentalRequest.all

  end

  def new
    @request = CatRentalRequest.new
  end

  def create
    @request = CatRentalRequest.new()
  end
end
