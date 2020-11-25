class CrimeFile < ApplicationRecord
  MAX_FILE_SIZE = 50
  belongs_to :crime
  belongs_to :user
  has_one_attached :file
  validates :file, file_size: { less_than_or_equal_to: MAX_FILE_SIZE.megabytes }
end
