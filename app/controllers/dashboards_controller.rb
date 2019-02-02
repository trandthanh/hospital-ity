class DashboardsController < ApplicationController

  def hebergements
    authorize :dashboard, :hebergements?
    @userflats = Flat.where(user: current_user)

    @user = current_user
  end

  def sejours
    authorize :dashboard, :sejours?
    @user = current_user
    @mybookings = current_user.bookings

    @currentbookings = @mybookings.select { |booking| booking.arrival < Date.today && Date.today < booking.departure }
    @futurebookings = @mybookings.select { |booking| Date.today < booking.arrival }
    @pastbookings = @mybookings.select { |booking| booking.departure < Date.today }
  end

end
