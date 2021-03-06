class BusinessesController < ApplicationController

  def new
    @city = City.new
    @business = Business.new
    render :new
  end

  def create
    @city = City.find_or_create_by(city_params)
    @business = @city.businesses.new(business_params)
    if @business.save
      redirect_to business_url(@business)
    else
      flash.now[:errors] = @business.errors.full_messages + @city.errors.full_messages
      render :new
    end
  end

  def edit
    @business = Business.find(params[:id])
    @city = City.find_or_create_by(id: @business.city_id)
    render :edit
  end

  def update
    @business = Business.find(params[:id])
    @city = @business.city
    if @business.update(business_params) && @city.update(city_params)
      redirect_to business_url(@business)
    else
      flash.now[:errors] = @business.errors.full_messages + @city.errors.full_messages
      render :edit
    end
  end

  def show
    @business = Business.find(params[:id])
    render :show
  end

  def index
    render :index
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
