class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :zipcode
      t.string :zipcode_district
      t.integer :capacity
      t.integer :number_of_rooms
      t.integer :price_per_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
