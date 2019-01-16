class AddFamilyMemberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_member, :string
  end
end
