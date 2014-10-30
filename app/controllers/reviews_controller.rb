class ReviewsController < ApplicationController
  before_action :require_signed_in!
  before_action :no_double_review, only: [:new, :create]

  def new
    @review = Review.new({business_id: params[:business_id]})
    render :new
  end

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @review.errors.full_messages
      render :new
    end
  end

  def edit
    @review = current_user.reviews.find(params[:id])
    render :edit
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @review.errors.full_messages
      render :edit
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to user_url(current_user)
  end


  private
  def no_double_review
    business_id = (params[:business_id] || review_params[:business_id])
    if current_user.reviews.exists?(business_id: business_id)
      flash[:errors] = ["cant create more than one review for the same business"]
      redirect_to user_url(current_user)
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating, :business_id)
  end
end
