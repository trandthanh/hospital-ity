class DashboardsController < ApplicationController

  def hebergements
    authorize :dashboard, :hebergements?
    @userflats = Flat.where(user: current_user)

    @user = current_user
  end

  def sejours
    authorize :dashboard, :sejours?
    @user = current_user

    @userbookings = Booking.where(user: current_user)
  end

end
