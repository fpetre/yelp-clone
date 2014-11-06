
json.array! @cities do |city|
  json.(city, :id, :city_name)

  json.businesses city.businesses do |business|
    json.(business, :id, :name, :address, :zip, :phone_number, :website_address, :average_rating)
    json.city city.city_name
    json.state city.state
    json.country city.country
  end
end
