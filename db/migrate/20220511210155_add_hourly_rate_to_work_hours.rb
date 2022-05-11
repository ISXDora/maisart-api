class AddHourlyRateToWorkHours < ActiveRecord::Migration[7.0]
  def change
    add_column :work_hours, :hourly_rate, :decimal, precision: 4, scale: 2
  end
end
