class DashboardPolicy < Struct.new(:user, :dashboard)

  def hebergements?
    true if user.super_host?
  end

  def sejours?
    true unless user.super_host? || user.hospital_admin?
  end

end
