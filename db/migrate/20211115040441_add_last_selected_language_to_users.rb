class AddLastSelectedLanguageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_selected_language, :integer , default: 0, null: false
  end
end
