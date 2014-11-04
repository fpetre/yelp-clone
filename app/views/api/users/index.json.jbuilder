json.users @users do |user|
  json.username user.username
  json.reviews user.reviews do |review|
    json.(review, :content, :rating, :created_at, :id)
    json.businessname review.business.name
    json.userid user.id
  end
end