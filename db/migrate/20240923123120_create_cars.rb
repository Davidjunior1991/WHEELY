class CreateCars < ActiveRecord::Migration[7.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :brand
      t.float :price_per_day
      t.string :category

      t.timestamps
    end
  end
end
