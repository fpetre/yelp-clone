json.(@city, :id, :city_name)

json.yelpLogoImage image_path("header_logo.png")
json.searchImage image_path("magnifying_glass_image.png")

json.businesses @city.businesses do |business|
  json.(business, :id, :name, :address, :zip, :phone_number, :website_address, :average_rating)
  json.city @city.city_name
  json.state @city.state
  json.country @city.country
end
