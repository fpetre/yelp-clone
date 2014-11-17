Business.create!([
  {name: "Peter Pan Donut & Pastry Shop", zip: "11222", phone_number: "(718) - 555 - 5555", website_address: "", address: "727 Manhattan Ave", city_id: 1},
  {name: "Pies-n-Thighs", zip: "11211", phone_number: "", website_address: "", address: "166 S 4th St", city_id: 1},
  {name: "Ted & Honey", zip: "11201", phone_number: "", website_address: "", address: "264 Clinton St", city_id: 1},
  {name: " Hartwell Vegetarian", zip: "11218", phone_number: "(718) 555-5555", website_address: "", address: "1017 Cortelyou Rd", city_id: 1},
  {name: "Zen Vegetarian House", zip: "11226", phone_number: "", website_address: "", address: "773 Flatbush Ave", city_id: 1},
  {name: "The Original John’s Deli", zip: "11223", phone_number: "(718) 555 - 5555", website_address: "", address: "2033 Stillwell Ave", city_id: 1},
  {name: "Mill Basin Kosher Delicatessen", zip: "11234", phone_number: "", website_address: "", address: "5823 Ave T", city_id: 1},
  {name: "Tea Lounge", zip: "11215", phone_number: "", website_address: "", address: "837 Union St", city_id: 1},
  {name: "Café Martin", zip: "11215", phone_number: "", website_address: "", address: "355 5th Ave", city_id: 1},
  {name: "Sarabeth’s Bakery", zip: "10011", phone_number: "", website_address: "", address: "75 9th Ave", city_id: 3},
  {name: "The Stanton Social", zip: "10002", phone_number: "(212) 555-5555", website_address: "", address: "99 Stanton St", city_id: 3},
  {name: "Jean-Georges", zip: "10023", phone_number: "", website_address: "", address: "1 Central Park W", city_id: 3},
  {name: "Forty Carrots", zip: "10022", phone_number: "", website_address: "", address: "141-199 E 59th St", city_id: 3},
  {name: "Maoz Vegetarian", zip: "10003", phone_number: "", website_address: "", address: "38 Union Sq E", city_id: 3},
  {name: "Cafe Airlie", zip: "07102", phone_number: "", website_address: "", address: "32 Commerce St", city_id: 4},
  {name: "Blue Lotus", zip: "07302", phone_number: "(201) 555-5555", website_address: "", address: "131 Erie St", city_id: 6},
  {name: "Veggie Heaven", zip: "07043", phone_number: "(973) 555-5555", website_address: "", address: "631 Valley Rd", city_id: 7},
  {name: "Sahara Deli", zip: "07105", phone_number: "(973) 555-5555", website_address: "", address: "22 24 Ferry St", city_id: 4},
  {name: "Panorama Cafe", zip: "11432", phone_number: "", website_address: "", address: "84-73 Parsons Blvd", city_id: 8},
  {name: "Ananda Fuara", zip: "94102", phone_number: "", website_address: "", address: "1298 Market St", city_id: 9},
  {name: "Cinco De Mayo", zip: "07201", phone_number: "", website_address: "", address: "1169 Dickinson St", city_id: 10},
  {name: "Pandang", zip: "07079", phone_number: "", website_address: "", address: "8-12 Village Plz", city_id: 11},
  {name: "Empanadas Cafe", zip: "11368", phone_number: "", website_address: "", address: "56-27 Van Doren St", city_id: 8},
  {name: "Wafa’s", zip: "11375", phone_number: "", website_address: "", address: "100-05 Metropolitan Ave", city_id: 8},
  {name: "Mike’s Deli", zip: "10458", phone_number: "", website_address: "", address: "2344 Arthur Ave", city_id: 12}
])
City.create!([
  {city_name: "Brooklyn", country: "United States", state: "New York"},
  {city_name: "New York", country: "United States", state: "New York"},
  {city_name: "Newark", country: "United States", state: "New Jersey"},
  {city_name: "Jersey City", country: "United States", state: "New Jersey"},
  {city_name: "Montclair", country: "United States", state: "New Jersey"},
  {city_name: "Queens", country: "United States", state: "New York"},
  {city_name: "San Francisco", country: "United States", state: "CA"},
  {city_name: "Elizabeth", country: "United States", state: "New Jersey"},
  {city_name: "South Orange", country: "United States", state: "New Jersey"},
  {city_name: "Bronx", country: "United States", state: "New York"}
])
User.create!([
  {username: "Piglet", password_digest: "$2a$10$xqbA1bMgLgCo5BUj0AjIZuKCHkXItHYUzeMcPTmd3QX0OSqx9oOYy", session_token: "plqzRiHa-j0VR7urrDWiTg", profile_photo_file_name: "data", profile_photo_content_type: "image/jpeg", profile_photo_file_size: 7721, profile_photo_updated_at: "2014-11-17 22:12:03"},
  {username: "Tigger", password_digest: "$2a$10$zPyNMKDfZSnmYyS..COXq.Y7Y/7mnF6.MseLd7PtcwWEjkpFvD0xS", session_token: "Ph1MhUTlWkrSS06Y-A45Fw", profile_photo_file_name: "data", profile_photo_content_type: "image/jpeg", profile_photo_file_size: 192246, profile_photo_updated_at: "2014-11-17 22:13:01"},
  {username: "Eeyore", password_digest: "$2a$10$cedcrjNxxWDcDC.fjcwUJOcStFnyOgODQPicFHEHpzb.XN0eJMcua", session_token: "3UJbD7L6sIBYlyblqntdHQ", profile_photo_file_name: "data", profile_photo_content_type: "image/jpeg", profile_photo_file_size: 8762, profile_photo_updated_at: "2014-11-17 22:26:27"},
  {username: "Owl", password_digest: "$2a$10$1YvkXLqgWusYPys9GVxsTeBLhcUVPXamldfJIfvxtUwsy3ccG725O", session_token: "azc1NnGhAtI1YjtMgueQFw", profile_photo_file_name: "data", profile_photo_content_type: "image/jpeg", profile_photo_file_size: 28574, profile_photo_updated_at: "2014-11-17 22:36:20"},
  {username: "Rabbit", password_digest: "$2a$10$okSGn.ka2s8fbN79jP833uRSyEoRrkL3Oi1/SpF8HHejdJoK2nMXK", session_token: "OAqF2gcoi72z4BnvVcJWMQ", profile_photo_file_name: "data", profile_photo_content_type: "image/jpeg", profile_photo_file_size: 255593, profile_photo_updated_at: "2014-11-17 22:38:37"},
  {username: "Paddington", password_digest: "$2a$10$3mEKNK32t1BTPVA4qic1q.SbCM15qdfy74.DY7v5pJHLKaMdoRCx6", session_token: "mFrWOQsyZU-cWBUU7gGKQQ", profile_photo_file_name: "data", profile_photo_content_type: "image/jpeg", profile_photo_file_size: 30989, profile_photo_updated_at: "2014-11-17 22:47:01"},
  {username: "Winnie", password_digest: "$2a$10$yj66HjVMYc1ysIdfoy.8eeMHrTJCGRfsm4FQ4GN/AXjoEWFEoAwr.", session_token: "92fHmNCrir0Ec4025-aQ5A", profile_photo_file_name: "data", profile_photo_content_type: "image/jpeg", profile_photo_file_size: 199307, profile_photo_updated_at: "2014-11-17 14:47:03"}
])
