class RemoveHostFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :host, :boolean
  end
end
