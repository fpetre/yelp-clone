class BusinessesController < ApplicationController

  def new
    @business = Business.new()
    render :new
  end

  def create
    @business = Business.new(business_params)
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
