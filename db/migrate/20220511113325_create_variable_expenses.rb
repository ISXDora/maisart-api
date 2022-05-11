class CreateVariableExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :variable_expenses do |t|
      t.string :name
      t.decimal :value, precision: 4, scale: 2
      t.references :studio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
