class RemoveCityIdUniquenessIndexCheck < ActiveRecord::Migration
  def change
    remove_index :businesses, :city_id
    add_index :businesses, :city_id
  end
end
