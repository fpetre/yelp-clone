class Api::StaticPagesController < ApplicationController

  def search
    @search = Business.includes(:city).search_by_name_and_address(params[:name_query], params[:location_query], params[:page], 10)
    render :search
  end

end
