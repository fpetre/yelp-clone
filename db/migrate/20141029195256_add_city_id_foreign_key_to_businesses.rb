class AddCityIdForeignKeyToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :city_id, :integer, null: false
    add_index :businesses, :city_id, unique: true
  end
end
