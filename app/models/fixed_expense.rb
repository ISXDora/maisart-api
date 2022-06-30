class FixedExpense < ApplicationRecord
  has_many :studio 
  validates :name, presence: true
  validates :value, presence: true
end
