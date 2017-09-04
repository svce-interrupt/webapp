class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.boolean :e1
      t.boolean :e2
      t.boolean :e3
      t.boolean :e4
      t.boolean :e5
      t.boolean :e6
      t.boolean :e7
      t.boolean :e8
      t.boolean :e9

      t.references :users, index: true

      t.timestamps
    end
  end
  add_foreign_key :events, :users
end
