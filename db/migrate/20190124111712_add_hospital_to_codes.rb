class AddHospitalToCodes < ActiveRecord::Migration[5.2]
  def change
    add_reference :codes, :hospital, foreign_key: true
  end
end
