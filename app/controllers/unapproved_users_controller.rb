class UnapprovedUsersController < ApplicationController

  def unapprovedlist
    authorize :unapproved_user, :unapprovedlist?

    @user = current_user

    if params[:approved] == "false"
      @users = User.where(approved: false, hospital_id: current_user.hospital_id)
      # @users = policy_scope(User).where(approved: false)
    else
      @users = User.where(hospital_id: current_user.hospital_id)
      # @users = policy_scope(User)
    end
  end

  # def edit

  # end
end
