class BookingsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.flat = @flat
    @booking.user = @user
    # @booking.trip_price = @booking.total_price
    if @booking.save
      redirect_to sejours_path
    else
      render 'flats/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival, :departure)
  end
end



