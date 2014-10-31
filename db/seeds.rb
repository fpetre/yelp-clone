require 'faker'
Faker::Config.locale = 'en-US'

city1 = City.create!({city_name: "Hoboken", country: "United States", state: "New Jersey"})
city2 = City.create!({city_name: "Brooklyn", country: "United States", state: "New York"})
city3 = City.create!({city_name: "Bronx", country: "United States", state: "New York"})
city4 = City.create!({city_name: "New York", country: "United States", state: "New York"})

b1 = Business.create!({name: "Florins deli", zip: "11224", phone_number: "", website_address: "", address: "2672", city_id: city2.id})
b2 = Business.create!({name: "deli", zip: "11224", phone_number: "", website_address: "", address: "2672 west 36 st", city_id: city2.id})
b3 = Business.create!({name: "Chris deli", zip: "11224", phone_number: "1234", website_address: "", address: "234234", city_id: city2.id})
b4 = Business.create!({name: "KC's Vegan Delli ", zip: "10005", phone_number: "", website_address: "", address: "11 Wall st", city_id: city4.id})

user1 = User.create!({password_digest: "$2a$10$cqUjEjnR1BJT99uxCM0CMOueyCXh028jrCcHqJ2SJoxJn7VRfVEPG", session_token: "IPKJc8pR46kKcTH7g38nFQ", username: "fpetre"})
user2 = User.create!({username:"mike", password: "password"})
user3 = User.create!({username:"KC", password: "password"})

Review.create!([
  {content: "\t\r\n\tsdfdasfadsfdsfsdf\r\n\t\r\n\t\r\n\t\r\n\t", rating: 5, user_id: 1, business_id: 1},
  {content: "\twooho\r\n\t", rating: 5, user_id: 1, business_id: 3},
  {content: "\tasdasd\r\n\t", rating: 5, user_id: 1, business_id: 4}
])

Review.create!({content:"mike wrote this", rating: 1, user_id: user2.id, business_id: b1.id})
Review.create!({content:"KC wrote this", rating: 3, user_id: user3.id, business_id: b1.id})

11.times do
  City.create!({city_name: Faker::Address.city, country: "United States", state: Faker::Address.state})
end

11.times do
  User.create!({username: Faker::Name.name, password: Faker::Internet.password(8) })
end

10.times do
Business.create!({
  name: Faker::Company.name,
  zip: Faker::Address.zip,
  phone_number: Faker::PhoneNumber.phone_number,
  website_address: Faker::Internet.domain_name,
  address: Faker::Address.street_address,
  city_id: rand(10) + 1
  })
end



10.times do
  Review.create!({content:Faker::Lorem.paragraph, rating: rand(5) + 1 , user_id: rand(10) + 1, business_id: rand(10) + 1})
end

