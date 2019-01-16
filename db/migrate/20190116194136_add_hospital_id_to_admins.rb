class AddHospitalIdToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_reference :admins, :hospital, foreign_key: true
  end
end
