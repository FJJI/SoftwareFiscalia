class Region < ApplicationRecord
  has_many :comunas
  validates :region, uniqueness: true
end
