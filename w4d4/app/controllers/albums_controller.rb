class AlbumsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @parent = nil
    @collection = Album.all
    render "shared/index"
  end
  def show
    @main = Album.find(params[:id])
    @parent = Band.find(@main.band_id)
    @collection = @main.tracks
    render "shared/index"
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = nil if @album.band_id == 0
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :recorded)
  end
end
