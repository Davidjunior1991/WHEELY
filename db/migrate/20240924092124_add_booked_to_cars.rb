class AddBookedToCars < ActiveRecord::Migration[7.2]
  def change
    add_column :cars, :booked, :boolean
  end
end
