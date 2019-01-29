class DashboardsController < ApplicationController

  def hebergements
    authorize :dashboard, :hebergements?
  end

end
