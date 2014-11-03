class Business < ActiveRecord::Base
  include PgSearch

  validates :name, :city, :zip, :address, presence: true
  validates :zip, length: {minimum: 5}

  has_many :reviews, inverse_of: :business
  belongs_to :city, inverse_of: :businesses

  def average_rating

   total_ratings = self.reviews.inject(0) do |rating_total, review|
     rating_total + review.rating
    end
    return 0 if self.reviews.size < 1
    @rating = total_ratings / self.reviews.size

  end

  #@users =  User.paginate_by_sql(sql, :page => @page, :per_page => @per_page)
  def self.search_by_name_and_address(name_query, address_query, page, per_page)
    name_query = name_query == "" ? "%" : "%" + name_query + "%"
    address_query = address_query == "" ? "%" : "%" + address_query + "%"
    Business.paginate_by_sql([
      "SELECT businesses.* FROM businesses JOIN (SELECT cities.id FROM cities WHERE UPPER(city_name) LIKE :address OR UPPER(country) LIKE :address OR UPPER(state) LIKE :address) AS sub_cities ON businesses.city_id = sub_cities.id WHERE UPPER(name) LIKE :name",
      {address: address_query.upcase, name: name_query.upcase},
      ],
      page: page,
      per_page: per_page
      )
  end
end

