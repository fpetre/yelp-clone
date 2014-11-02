class Api::ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      render :show
    else
      render :json => {error: @review.errors.full_messages}
    end
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_params)
      render :show
    else
      render :json => {error: @review.errors.full_messages}
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :business_id)
  end

end