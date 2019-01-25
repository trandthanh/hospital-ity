class DashboardPolicy < Struct.new(:user, :dashboard)

  def hebergements?
    true if user.super_host?
  end

end
