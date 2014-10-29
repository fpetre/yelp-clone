class Business < ActiveRecord::Base
  validates :name, :country, :city, :state, :zip, presence: true
  validates :zip, length: {minimum: 5}
  validates :country, uniqueness: { scope: [:city, :state, :zip]}
  after_initialize :ensure_country

  has_many :reviews, inverse_of: :business



  private
  def ensure_country
    self.country ||= "USA"
  end

end

