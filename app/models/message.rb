class Message < ApplicationRecord
  belongs_to :crime
  belongs_to :user
end
