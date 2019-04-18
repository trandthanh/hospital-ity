class CodesController < ApplicationController
  def new
    @hospital = Hospital.find(params[:hospital_id])

    @code = Code.new
    authorize @code

    @user = current_user
  end

  def create
    @user = current_user

    @code = Code.new(code_params)
    authorize @code
    @hospital = Hospital.find(params[:hospital_id])
    @code.hospital = @hospital
    if @code.save
      redirect_to community_path
    else
      render :new
    end
  end

  def destroy
    @code = Code.find(params[:id])
    authorize @code
    @code.delete
    redirect_to community_path
  end

  private

  def code_params
    params.require(:code).permit(:hospital_id, :code)
  end
end
