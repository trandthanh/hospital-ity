class AddBathroomToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :bathroom, :boolean, null: false, default: false
  end
end
