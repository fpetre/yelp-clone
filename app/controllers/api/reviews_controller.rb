class Api::ReviewsController < ApplicationController
   before_action :no_double_review, only: [:new, :create]

  def show
    @review = Review.includes(:business).find(params[:id])
    render :show
  end

  def index
    @reviews = Review.includes(:business).all
    render :index
  end


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

  def no_double_review
    business_id = (params[:business_id] || review_params[:business_id])
    if current_user.reviews.exists?(business_id: business_id)
      render :json => "cant create more than one review for the same business",
        :status => :unprocessable_entity
    end
  end

end
