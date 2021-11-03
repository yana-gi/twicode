class AddUserIdToCode < ActiveRecord::Migration[6.1]
  def change
    add_reference :code, :user, null: false, foreign_key: true
  end
end
