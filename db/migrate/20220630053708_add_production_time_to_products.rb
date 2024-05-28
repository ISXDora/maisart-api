class AddProductionTimeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :production_time, :timestamp
  end
end
