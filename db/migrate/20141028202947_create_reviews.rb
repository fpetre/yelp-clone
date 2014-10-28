class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.integer :user_id
      t.integer :business_id

      t.timestamps
    end
    add_index(:reviews, [:user_id, :business_id], unique: true)
  end
end
