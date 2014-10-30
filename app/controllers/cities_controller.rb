class CitiesController < ApplicationController

  def show
    @city = current_city
    render :show
  end
end
