class WorkHour < ApplicationRecord
  has_one :user
  validates :compensation, presence: true
  validates :working_hours_per_day, presence: true
  validates :working_days_per_week, presence: true
end
# volte a dar manutenção a este projeto
