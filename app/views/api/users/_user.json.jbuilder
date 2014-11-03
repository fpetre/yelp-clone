json.username user.username
  json.reviews user.reviews do |review|
    json.(review, :content, :rating, :created_at)
    json.businessname review.business.name
    json.userid user.id
  end


