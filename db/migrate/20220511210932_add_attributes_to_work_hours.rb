class AddAttributesToWorkHours < ActiveRecord::Migration[7.0]
  def change
    change_column :work_hours, :compensation, :decimal, precision: 4, scale: 2
  end
end
