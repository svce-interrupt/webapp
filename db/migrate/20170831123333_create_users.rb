class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :email ,index: true
    	t.string :password_digest
    	t.string :remember_digest
      t.string :name
      t.string :phone
      t.string :college

      t.timestamps
    end
  end
end
