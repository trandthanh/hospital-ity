class FlatsController < ApplicationController
  before_action :set_flat, only: [:show]
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

  def index
  end

  def search
    # @booked = Flat.where.not('? BETWEEN flat.bookings.arrival AND flat.bookings.departure', Date.parse(params[:query][:date])
    # @booked = Flat.left_outer_joins(:bookings).where.not('? BETWEEN bookings.arrival AND bookings.departure', Date.parse(params[:query][:date]))
    # @booked = Flat.left_outer_joins(:bookings).where.not('? BETWEEN bookings.arrival AND bookings.departure', Date.parse(params[:query][:date]))
    # Booking.where('arrival_date < ? OR leaving_date > ?', self.arrival_date, self.leaving_date)
    # @booked = Flat.joins(:bookings).where('bookings.departure < ? AND bookings.arrival > ?', Date.parse(params[:query][:arrival]), Date.parse(params[:query][:departure]))
    # @booked = Flat.joins("LEFT JOIN bookings ON bookings.flat_id = flats.id").where("bookings.id IS NULL OR bookings.arrival > ? AND bookings.departure < ?", Date.parse(params[:query][:departure]), Date.parse(params[:query][:arrival])).group("flats.id")
    # @booked = Flat.left_outer_joins(:bookings)
    #    .where.not('? BETWEEN bookings.arrival AND bookings.departure OR
    #        ? BETWEEN bookings.arrival OR bookings.departure',
    #        params[:query][:arrival], params[:query][:departure])
    # @searchedflats = Flat.joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]})
    # authorize @searchedflats
    # @final = Flat.joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]}).joins(:bookings).where.not('? BETWEEN bookings.arrival AND bookings.departure', Date.parse(params[:query][:date]))
    # @capacity = Flat.where('capacity >= ?', params[:query][:capacity])


    if params[:query][:capacity].blank? && params[:query][:date].blank?
      @availableflats = Flat.joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]})
      authorize :flat, :search?
    elsif params[:query][:capacity].blank?
      @availableflats = Flat.joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]}).select { |flat| flat.unavailable_dates.none? { |hash| hash[:from] <= Date.parse(params[:query][:date]) && hash[:to] >= Date.parse(params[:query][:date]) }}
      authorize :flat, :search?
    elsif params[:query][:date].blank?
      @availableflats = Flat.joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]})
      authorize :flat, :search?
    else
      @availableflats = Flat.where('capacity >= ?', params[:query][:capacity]).joins(:hospital).where(:hospitals => {:hospital_name => params[:query][:hospital]}).select { |flat| flat.unavailable_dates.none? { |hash| hash[:from] <= Date.parse(params[:query][:date]) && hash[:to] >= Date.parse(params[:query][:date]) }}
      authorize :flat, :search?
    end


    @hospital = Hospital.where(hospital_name: params[:query][:hospital])
    @places = @availableflats + @hospital

    @markers = @places.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        image_url: flat.is_a?(Hospital) ? helpers.asset_url('placeholder.png') : helpers.asset_url('house.png')
      }
    end
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
    params.require(:flat).permit(:address, :zipcode, :zipcode_district, :capacity, :number_of_rooms, :price_per_day, :hospital_id, :photo, :flat_type)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
