class PhotosController < ApplicationController

  def new
    @flat = Flat.find(params[:flat_id])
    @photo = Photo.new
    authorize @photo

    @user = current_user
  end

  def create
    @photo = Photo.new(photo_params)
    @flat = Flat.find(params[:flat_id])
    @photo.flat = Flat.find(params[:flat_id])
    authorize @photo
    authorize @flat

    if @photo.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private


  def photo_params
    params.require(:photo).permit(:url, :room)
  end

end



