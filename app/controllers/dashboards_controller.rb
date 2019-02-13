class DashboardsController < ApplicationController

  def hebergements
    authorize :dashboard, :hebergements?
    @userflats = Flat.where(user: current_user)

    @user = current_user

    @total_days = counting_booking_days
    @total_ppl_helped = Booking.joins(:flat).where(:flats => {:user => current_user}).group_by(&:user).count
  end

  def sejours
    authorize :dashboard, :sejours?
    @user = current_user
    @mybookings = current_user.bookings

    @currentbookings = @mybookings.select { |booking| booking.arrival < Date.today && Date.today < booking.departure }
    @futurebookings = @mybookings.select { |booking| Date.today < booking.arrival }
    @pastbookings = @mybookings.select { |booking| booking.departure < Date.today }

    @bookingstocomment = @mybookings.select { |booking| booking.departure < Date.today && Date.today < booking.departure + 1.month}
  end

  def profile
    authorize :dashboard, :profile?
    @user = current_user
  end

  private

  def counting_booking_days
    sum = 0
    @user.flats.each do |flat|
      flat.bookings.each do |booking|
        sum += booking.booking_days
      end
    end
    return sum
  end

end
