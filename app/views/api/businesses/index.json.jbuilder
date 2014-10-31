
json.array! @businesses do |business|
  json.partial! "business", :business => business
end