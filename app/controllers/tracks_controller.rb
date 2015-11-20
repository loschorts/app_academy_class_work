class TracksController < ApplicationController
  before_action :ensure_logged_in
  def index
    @collection = Track.all.sort_by(&:name)
    render "shared/index"
  end
  def show
    @track = Track.find(params[:id])
    @band = @track.band
    @notes = @track.notes
  end
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to tracks_url
  end
  def new
    @track = Track.new
  end
  def create
    @track = Track.new(track_params)
    @track.bonus = (params[:track][:bonus] == "True" ? true : false)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end
  private
  def track_params
    params.require(:track).permit(:name, :album_id)
  end
end
