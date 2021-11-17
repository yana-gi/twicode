class AddUniqueToLanguagesName < ActiveRecord::Migration[6.1]
  def change
    add_index :languages, :name, unique: true
  end
end
