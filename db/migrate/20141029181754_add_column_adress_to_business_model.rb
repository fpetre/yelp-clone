class AddColumnAdressToBusinessModel < ActiveRecord::Migration
  def change
    add_column :businesses, :address, :string, null: false
    add_index :businesses, :address
  end
end
