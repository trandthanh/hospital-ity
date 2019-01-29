class FlatsController < ApplicationController
  before_action :set_flat, only: [:show]
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

  def index
  end

  def search
    # @searchedflats = Flat.joins(:hospitals).where("hospitals.hospital_name = ${params[:query][:hospital]}")

    @searchedflats = Flat.joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]})
    authorize @searchedflats
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    authorize @flat
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def show
    authorize @flat
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :zipcode, :zipcode_district, :capacity, :number_of_rooms, :price_per_day, :hospital_id)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
