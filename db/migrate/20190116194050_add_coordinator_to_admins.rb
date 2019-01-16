class AddCoordinatorToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :coordinator, :boolean, null: false, default: false
  end
end
