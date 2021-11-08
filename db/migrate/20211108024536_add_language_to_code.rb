class AddLanguageToCode < ActiveRecord::Migration[6.1]
  def change
    add_column :code, :language, :integer, default: 0, null: false
  end
end
