class DashboardsController < ApplicationController

  def hebergements
    authorize :dashboard, :hebergements?
    @userflats = Flat.where(user: current_user)
  end

end
