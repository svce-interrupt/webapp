class AddForeignKeyToEvent < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :events, :users
  end
end
