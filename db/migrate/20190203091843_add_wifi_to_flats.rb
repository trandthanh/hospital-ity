class AddWifiToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :wifi, :boolean, null: false, default: false
  end
end
