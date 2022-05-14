class Studio < ApplicationRecord
  has_one :user
  validates :name, presence: false, uniqueness: true
end
