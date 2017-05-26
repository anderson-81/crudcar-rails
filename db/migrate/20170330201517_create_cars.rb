class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model
      t.string :plate
      t.integer :year
      t.decimal :marketval, :precision => 10, :scale => 2
      t.references :Customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
