class AddHospitalAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hospital_admin, :boolean, null: false, default: false
  end
end
