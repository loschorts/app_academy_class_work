class Api::TracksController < ApplicationController
  def index
    render :json Track.all
  end

  def create
    render :json Track.create(track_params)
  end

  def destroy
    render :json Track.find(params[:id]).destroy
  end

  def track_params
    params.require(:track).permit(:name, :roll)
  end
end
