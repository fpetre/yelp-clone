class RemoveCityStateCountryFromBusiness < ActiveRecord::Migration
  def change
    remove_index :businesses, name: "index_businesses_on_country_and_city_and_state_and_zip"
    remove_column :businesses, :city
    remove_column :businesses, :country
    remove_column :businesses, :state
  end
end
