class AddVerifiedToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :verified, :boolean, null: false, default: false
  end
end
