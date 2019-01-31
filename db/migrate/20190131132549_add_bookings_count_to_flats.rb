class AddBookingsCountToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :bookings_count, :integer
  end
end
