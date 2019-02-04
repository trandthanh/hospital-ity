class AddWashingToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :washing, :boolean, null: false, default: false
  end
end
