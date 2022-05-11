class FixedExpense < ApplicationRecord
  has_one :studio
  validates :name, presence: true
  validates :value, presence: true
end
