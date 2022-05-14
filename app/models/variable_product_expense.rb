class VariableProductExpense < ApplicationRecord
  has_one :product
  validates :name, presence: true
  validates :value, presence: true
end
