json.(@city, :id, :city_name, :state)

json.yelpLogoImage image_path("header_logo.png")
json.searchImage image_path("magnifying_glass_image.png")

json.businesses @city.businesses do |business|
  json.(business, :id, :name, :address, :zip, :phone_number, :website_address, :average_rating)
  json.city @city.city_name
  json.state @city.state
  json.country @city.country

  json.reviews business.reviews do |review|
      json.(review, :content, :rating, :created_at, :id)
      json.businessname business.name
      json.business_id business.id
      json.user_id review.user_id
  end

end
