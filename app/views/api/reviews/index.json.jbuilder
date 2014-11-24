json.array! @reviews do |review|
  json.(review, :content, :rating, :created_at, :id)
  json.businessname review.business.name
  json.user_id review.user_id
  json.business_id review.business_id
  json.authorname review.user.username
end
