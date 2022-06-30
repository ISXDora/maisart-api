class AddCountProductToStudios < ActiveRecord::Migration[7.0]
  def change
    add_column :studios, :count_product, :integer
  end
end
