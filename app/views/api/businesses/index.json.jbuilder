json.businesses @businesses do |business|
  json.(business, :name, :address, :zip, :phone_number, :website_address, :average_rating)
  json.city business.city.city_name
  json.state business.city.state
  puts "hey!!!!!!!!!-----------------***********@@@@@@@@@@@@@@@"
  json.country business.city.country

  json.reviews business.reviews do |review|
    json.(review, :content, :rating, :created_at)
    json.businessname business.name
    json.userid review.user_id
  end
end