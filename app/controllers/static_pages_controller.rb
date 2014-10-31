class StaticPagesController < ApplicationController

  def search
    query = params[:name_query] + " " + params[:location_query]
    @search = Business.search_by_location(query)

    if params[:search_type] == "business-search"
      render :business_search
    else
      render :review_search
    end
  end
end
