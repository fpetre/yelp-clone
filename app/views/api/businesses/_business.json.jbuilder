json.(business, :id, :name, :address, :zip, :phone_number, :website_address, :average_rating)
json.city business.city.city_name
json.city_id business.city.id
json.state business.city.state
json.country business.city.country


json.reviews business.reviews do |review|
    json.(review, :content, :rating, :id)
    json.businessname business.name
    json.business_id business.id
    json.user_id review.user_id
    json.created_at review.created_at.strftime("%m/%d/%y")
end
