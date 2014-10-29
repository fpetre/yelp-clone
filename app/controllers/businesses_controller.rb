class BusinessesController < ApplicationController

  def new
    @business = Business.new()
    render :new
  end

  def create
    @city = City.find_or_create_by({
      country: business_params[:country],
      name: business_params[:city],
      state: business_params[:state]
      })
      @business = @city.businesses.new(business_params)
    if @business.save
      redirect_to business_url(@business)
    else
      flash.now[:errors] = @business.errors.full_messages
      render :new
    end
  end

  def edit
    @business = Business.find(params[:id])
    render :edit
  end

  def update
    @business = Business.find(params[:id])
    if @business.update(business_params)
      redirect_to business_url(@business)
    else
      flash.now[:errors] = @business.errors.full_messages
      render :edit
    end
  end

  def show
    @business = Business.find(params[:id])
    render :show
  end

  private
  def business_params
    params.require(:businesses).permit(
    :name, :country, :city, :state, :zip, :phone_number, :address, :website_address
    )
  end

end
