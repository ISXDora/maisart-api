class Studio < ApplicationRecord
  has_one :user
  has_many :fixed_expenses
  validates :name, presence: false, uniqueness: true
end
