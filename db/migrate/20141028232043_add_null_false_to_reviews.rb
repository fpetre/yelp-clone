class AddNullFalseToReviews < ActiveRecord::Migration
  def change
    change_column(:reviews, :rating, :integer, null: false)
    change_column(:reviews, :user_id, :integer, null: false)
    change_column(:reviews, :business_id, :integer, null: false)
    change_column(:reviews, :content, :text, null: false)
  end
end
