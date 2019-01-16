class CreateHospitalFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_flats do |t|
      t.references :flat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
