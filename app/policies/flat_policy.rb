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

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end


  def toggle_available_status?
    true
  end
end
