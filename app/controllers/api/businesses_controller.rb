class Api::BusinessesController < ApplicationController

  def update
    @business = Business.find(params[:id])
    @city = @business.city
    if @business.update(business_params) && @city.update(city_params)
      render :show
    else
      render :json => {error: @business.errors.full_messages + @city.errors.full_messages}
      render :show
    end
  end

  def create
    @city = City.find_or_create_by(city_params)
    @business = @city.businesses.new(business_params)
    if @business.save
      render :show
    else
      render :json => {error: @business.errors.full_messages + @city.errors.full_messages}
      render :show
    end
  end

  def index
    @businesses = Business.includes(:reviews, :city).all
    render :index
  end

  def show
    @business = Business.includes(:reviews, :city).find(params[:id])
    render :show
  end



  private
  def business_params
    params.require(:business).permit(
    :name, :zip, :phone_number, :address, :website_address
    )
  end

  def city_params
    params.require(:city).permit(:country, :city_name, :state)
  end

end