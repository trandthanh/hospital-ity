class UnapprovedUsersController < ApplicationController

  def unapprovedlist
    authorize :unapproved_user, :unapprovedlist?

    @user = current_user

    @beneficiaries = User.where(super_admin: false, hospital_admin: false, super_host: false, hospital: @user.hospital)
    @codes = Code.where(hospital: @user.hospital)
    @hosts = User.where(super_host: true, super_admin: false, hospital_admin: false, hospital: @user.hospital)
  end

  # def edit

  # end
end
