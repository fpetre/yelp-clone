class Business < ActiveRecord::Base
  validates :name, :country, :city, :state, :zip, presence: true
  after_initialize :ensure_country

  has_many :reviews, inverse_of: :business



  private
  def ensure_country
    self.country ||= "USA"
  end



end

