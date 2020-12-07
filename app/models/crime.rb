class Crime < ApplicationRecord
  has_many_attached :images
  has_many_attached :files
  has_one_attached :clip
  has_many :messages
  validate :check_past_date

  def check_past_date
    errors.add(:fecha, "debe ser en el pasado") unless fecha < DateTime.now
  end
end

