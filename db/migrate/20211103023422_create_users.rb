class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :twitter_id
      t.string :twitter_name
      t.string :twitter_icon

      t.timestamps
    end
  end
end
