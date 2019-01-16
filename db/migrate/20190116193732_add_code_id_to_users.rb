class AddCodeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :code, foreign_key: true
  end
end
