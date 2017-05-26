class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.decimal :salary, :precision => 10, :scale => 2
      t.date :birthday
      t.string :gender

      t.timestamps null: false
    end
  end
end
