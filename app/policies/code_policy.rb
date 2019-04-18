class CodePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true if user.hospital_admin?
  end

  def create?
    true if user.hospital_admin?
  end

  def destroy?
    true if user.hospital_admin?
  end
end
