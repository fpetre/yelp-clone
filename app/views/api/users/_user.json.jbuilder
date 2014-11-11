json.(user, :username, :id, :password)
json.profile_photo_url asset_path(user.profile_photo.url(:small))
  json.reviews user.reviews do |review|
    json.(review, :content, :rating, :created_at, :id)
    json.businessname review.business.name
    json.business_id review.business_id
    json.user_id user.id
  end
