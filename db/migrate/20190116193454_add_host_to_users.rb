class AddHostToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :host, :boolean, null: false
  end
end
