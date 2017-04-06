class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.decimal :salary
      t.date :birthday
      t.string :gender

      t.timestamps null: false
    end
  end
end
