class AddAddressToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :address, :string
  end
end
