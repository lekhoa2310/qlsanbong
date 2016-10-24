class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :password
      t.integer  :role, default: 0
      t.timestamps null: false
    end
  end
end
