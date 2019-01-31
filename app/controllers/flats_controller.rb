class FlatsController < ApplicationController
  before_action :set_flat, only: [:show]
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

  def index
  end

  def search
    # @searchedflats = Flat.joins(:hospitals).where("hospitals.hospital_name = ${params[:query][:hospital]}")

    @searchedflats = Flat.joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]})
    authorize @searchedflats

    # @flats = Flat.where.not(latitude: nil, longitude: nil)
    # @flats = Flat.joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]}).not(latitude: nil, longitude: nil)
    # authorize @flats
    @hospital = Hospital.where(hospital_name: params[:query][:hospital])

    @test = @searchedflats + @hospital

    @markers = @test.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        # image_url: helpers.asset_url('hospitalmarker.png') if flat.is_a? Hospital
        image_url: flat.is_a?(Hospital) ? helpers.asset_url('placeholder.png') : helpers.asset_url('house.png')
      }
    end

    # @markers = @searchedflats.map do |flat|
    #   {
    #     lng: flat.longitude,
    #     lat: flat.latitude
    #   }
    # end

    # @markes = @hospital.map do |flat|
    #   {
    #     lng: flat.longitude,
    #     lat: flat.latitude
    #   }
    # end


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

    @booking = Booking.new
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :zipcode, :zipcode_district, :capacity, :number_of_rooms, :price_per_day, :hospital_id)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
