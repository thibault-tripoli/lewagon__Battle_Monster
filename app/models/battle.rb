class Battle < ApplicationRecord
  has_many :decks

  validates :status, presence: true
  validates :xp_win, numericality: { only_integer: true }
  validates :pc_win, numericality: { only_integer: true }
end
