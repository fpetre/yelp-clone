json.(user, :username, :id)
  json.reviews user.reviews do |review|
    json.(review, :content, :rating, :created_at, :id)
    json.businessname review.business.name
    json.business_id review.business_id
    json.user_id user.id
  end
