json.(user, :username, :id)
  json.reviews user.reviews do |review|
    json.(review, :content, :rating, :created_at, :id)
    json.businessname review.business.name
    json.businessid review.business_id
    json.userid user.id
  end
