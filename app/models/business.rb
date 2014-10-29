class Business < ActiveRecord::Base
  validates :name, :city, :zip, :address, presence: true
  validates :zip, length: {minimum: 5}

  has_many :reviews, inverse_of: :business

  belongs_to :city, inverse_of: :businesses



end

