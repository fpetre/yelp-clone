json.array! @search do |business|
  json.(business, :id, :name, :address, :zip, :phone_number, :website_address, :average_rating)
  json.city business.city.city_name
  json.state business.city.state
  json.country business.city.country
end
