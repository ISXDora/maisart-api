class Product < ApplicationRecord
  has_one :studio
  validates :name, presence: true
end
