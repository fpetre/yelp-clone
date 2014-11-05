class StaticPagesController < ApplicationController

  def search
    @search = Business.search_by_name_and_address(params[:name_query], params[:location_query], params[:page], 10)

    if params[:search_type] == "business-search"
      render :business_search
    else
      render :review_search
    end
  end

  def backbone
    render :backbone
  end

end
