class AddAddressToCars < ActiveRecord::Migration[7.2]
  def change
    add_column :cars, :address, :string
  end
end
