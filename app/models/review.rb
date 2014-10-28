class Review < ActiveRecord::Base
  validates :content, :rating, :user_id, :business_id, presence: true

  belongs_to :user, inverse_of: :reviews
  belongs_to :business, inverse_of: :reviews
end
