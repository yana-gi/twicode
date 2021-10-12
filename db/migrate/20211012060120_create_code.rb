class CreateCode < ActiveRecord::Migration[6.1]
  def change
    create_table :code do |t|
      t.text :body

      t.timestamps
    end
  end
end
