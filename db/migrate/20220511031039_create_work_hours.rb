class CreateWorkHours < ActiveRecord::Migration[7.0]
  def change
    create_table :work_hours do |t|
      t.decimal :compensation
      t.integer :working_hours_per_day
      t.integer :working_days_per_week
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
