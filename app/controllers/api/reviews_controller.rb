class Api::ReviewsController < ApplicationController
  # before_action :require_signed_in!
  # before_action :no_double_review, only: [:new, :create]

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      render :show
    else
      render :json => {error: @review.errors.full_messages},
        :status => :unprocessable_entity
    end
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_params)
      render :show
    else
      render :json => {error: @review.errors.full_messages},
        :status => :unprocessable_entity
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :business_id)
  end

end
