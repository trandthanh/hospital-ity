class BookingPolicy < ApplicationPolicy

  def create?
    true unless user.hospital_admin? || user.super_host?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
