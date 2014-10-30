
city1 = City.create!({city_name: "Hoboken", country: "United States", state: "New Jersey"})
 city2 = City.create!({city_name: "Brooklyn", country: "United States", state: "New York"})
city3 = City.create!({city_name: "Bronx", country: "United States", state: "New York"})
city4 = City.create!({city_name: "New York", country: "United States", state: "New York"})

Business.create!({name: "Florins deli", zip: "11224", phone_number: "", website_address: "", address: "2672", city_id: city2.id})
Business.create!({name: "deli", zip: "11224", phone_number: "", website_address: "", address: "2672 west 36 st", city_id: city2.id})
Business.create!({name: "Chris deli", zip: "11224", phone_number: "1234", website_address: "", address: "234234", city_id: city2.id})
Business.create!({name: "KC's Vegan Delli ", zip: "10005", phone_number: "", website_address: "", address: "11 Wall st", city_id: city4.id})

Review.create!([
  {content: "\t\r\n\tsdfdasfadsfdsfsdf\r\n\t\r\n\t\r\n\t\r\n\t", rating: 5, user_id: 1, business_id: 1},
  {content: "\twooho\r\n\t", rating: 5, user_id: 1, business_id: 3},
  {content: "\tasdasd\r\n\t", rating: 5, user_id: 1, business_id: 4}
])
User.create!([
  {password_digest: "$2a$10$cqUjEjnR1BJT99uxCM0CMOueyCXh028jrCcHqJ2SJoxJn7VRfVEPG", session_token: "IPKJc8pR46kKcTH7g38nFQ", username: "fpetre"}
])
