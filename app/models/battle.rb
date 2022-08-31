class Battle < ApplicationRecord
  has_many :decks, dependent: :destroy
  belongs_to :current_deck, class_name: "Deck", optional: true

  # @battle.current_deck = ...
  validates :status, presence: true
  validates :round, numericality: { only_integer: true }
  validates :xp_win, numericality: { only_integer: true }
  validates :pc_win, numericality: { only_integer: true }
end
