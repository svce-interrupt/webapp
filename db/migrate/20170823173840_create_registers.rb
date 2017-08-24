class CreateRegisters < ActiveRecord::Migration[5.0]
  def change
    create_table :registers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email ,index: true
      t.string :password
      t.string :phone
      t.string :college_name
      t.boolean :e1
      t.boolean :e2
      t.boolean :e3
      t.boolean :e4
      t.boolean :e5
      t.boolean :e6
      t.boolean :e7
      t.boolean :e8
      t.boolean :e9
    

      t.timestamps
    end
  end
end
