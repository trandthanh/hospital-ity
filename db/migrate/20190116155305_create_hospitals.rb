class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :hospital_name
      t.string :zipcode
      t.string :city

      t.timestamps
    end
  end
end
