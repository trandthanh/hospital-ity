class AddAvailabilityToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :availability, :boolean, null: false, default: false
  end
end
