class VariableExpenseProduct < ApplicationRecord
  has_one :products
  validates :name, presence: true
  validates :value, presence: true
end
