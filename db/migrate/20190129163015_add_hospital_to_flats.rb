class AddHospitalToFlats < ActiveRecord::Migration[5.2]
  def change
    add_reference :flats, :hospital, foreign_key: true
  end
end
