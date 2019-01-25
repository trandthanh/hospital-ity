class UnapprovedUserPolicy < ApplicationPolicy
  def unapprovedlist?
    # return false unless user.hospital_admin?
    # true
    true if user.hospital_admin?
  end


  class Scope < Scope
    def resolve
      scope.all
      # No all. We don't want to list all the profiles.
    end
  end


end
