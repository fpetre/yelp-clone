json.businesses @businesses do |business|
  json.partial! "business", :business => business
end
