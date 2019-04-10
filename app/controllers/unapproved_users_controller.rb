class UnapprovedUsersController < ApplicationController

  def unapprovedlist
    authorize :unapproved_user, :unapprovedlist?

    @user = current_user

    @beneficiaries = User.where(super_admin: false, hospital_admin: false, super_host: false)
  end

  # def edit

  # end
end
