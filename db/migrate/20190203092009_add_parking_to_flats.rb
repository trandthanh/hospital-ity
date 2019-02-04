class AddParkingToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :parking, :boolean, null: false, default: false
  end
end
