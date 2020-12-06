class Fiscal < ApplicationRecord
  has_many :user
  belongs_to :ufc, optional: true
end
