class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone_number
      t.string :website_address

      t.timestamps
    end
    add_index(:businesses, [:country, :city, :state, :zip], unique: true)
    add_index(:businesses, :name)
  end
end
