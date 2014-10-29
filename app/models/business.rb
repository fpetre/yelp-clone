class Business < ActiveRecord::Base
  validates :name, :country, :city, :city_id, :state, :zip, :address, presence: true
  validates :zip, length: {minimum: 5}
  validates :country, uniqueness: { scope: [:city, :state, :zip]}
  after_initialize :ensure_country

  has_many :reviews, inverse_of: :business

  belongs_to :city, inverse_of: :businesses



  private
  def ensure_country
    self.country ||= "USA"
  end

end

