class AddColumnToCode < ActiveRecord::Migration[6.1]
  def change
    add_column :code, :title, :string, default: '', null: false
  end
end
