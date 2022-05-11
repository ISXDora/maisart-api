class Studio < ApplicationRecord
  has_one :user
  validates :studio, presence: false, uniqueness: true
end
