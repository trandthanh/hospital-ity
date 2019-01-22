class AddCodeIndexToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :code, index: {:unique=>true}, foreign_key: true
  end
end
