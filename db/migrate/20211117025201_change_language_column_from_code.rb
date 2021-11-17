class ChangeLanguageColumnFromCode < ActiveRecord::Migration[6.1]
  def change
    remove_column :code, :language, :integer
    add_reference :code, :language, foreign_key: true
  end
end
