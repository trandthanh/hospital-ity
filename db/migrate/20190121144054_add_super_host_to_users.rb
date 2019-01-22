class AddSuperHostToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :super_host, :boolean, null: false, default: false
  end
end
