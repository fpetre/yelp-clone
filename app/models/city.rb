class City < ActiveRecord::Base
  validates :city_name, :country, :state, presence: true

  has_many(
  :businesses,
  class_name: "Business",
  foreign_key: :city_id,
  primary_key: :id,
  inverse_of: :city
  )

end
