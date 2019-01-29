class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true if user.super_host?
  end

  def show?
    true
  end

  def search?
    true
  end
end
