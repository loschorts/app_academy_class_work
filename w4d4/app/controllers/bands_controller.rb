class BandsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @bands = Band.all
  end

  def show
    @main = Band.find(params[:id])
    @collection = @main.albums
    render "shared/index"
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end
  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      redirect_to bands_url
    else
      fail
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
