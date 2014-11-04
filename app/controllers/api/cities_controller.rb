class Api::CitiesController < ApplicationController
  def show
    @city = City.includes(:businesses => :reviews).find(params[:id])
    render :show
  end

  def index
    @cities = City.includes(:businesses => :reviews).all
    render :index
  end
end
