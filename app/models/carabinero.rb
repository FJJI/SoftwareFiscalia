class Carabinero < ApplicationRecord
  has_many :user
  belongs_to :ufc, optional: true
  has_one :ucc
end
