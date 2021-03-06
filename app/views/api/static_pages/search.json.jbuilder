json.array! @search do |business|
  json.(business, :id, :name, :address, :zip, :phone_number, :website_address, :average_rating)
  json.city_id business.city_id
  json.city business.city.city_name
  json.state business.city.state
  json.country business.city.country
  json.totalReviews business.reviews.length
end
