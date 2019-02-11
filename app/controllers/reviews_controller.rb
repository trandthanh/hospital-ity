class ReviewsController < ApplicationController
  def new
    @user = current_user

    @flat = Flat.find(params[:flat_id])
    @review = Review.new

    authorize @review
  end

  def create
    @user = current_user

    @flat = Flat.find(params[:flat_id])

    @review = Review.new(review_params)
    authorize @review
    @review.flat = @flat
    @review.user = current_user
    if @review.save
      redirect_to flat_path(@flat)
    else
      redirect_to sejours_path
    end

  end

  private

  def review_params
    params.require(:review).permit(:comment, :user_id, :flat_id)
  end

end


