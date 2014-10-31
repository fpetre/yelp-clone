class Business < ActiveRecord::Base
  include PgSearch

  validates :name, :city, :zip, :address, presence: true
  validates :zip, length: {minimum: 5}

  # change it so it uses join table
  pg_search_scope :search_by_name, :against => :name
  pg_search_scope :search_by_location_and_name, :against => [:name, :address], :associated_against => {

    :city => [:city_name, :country, :state]
  }

  has_many :reviews, inverse_of: :business
  belongs_to :city, inverse_of: :businesses

  def average_rating
    @rating = self.reviews.average(:rating).try(:to_int)
  end



end

