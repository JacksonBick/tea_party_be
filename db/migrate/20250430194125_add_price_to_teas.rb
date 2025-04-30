class AddPriceToTeas < ActiveRecord::Migration[7.1]
  def change
    add_column :teas, :price, :decimal
  end
end
