class Attack < ApplicationRecord
  belongs_to :specie
  has_many :decks, dependent: :destroy

  validates :damage, numericality: { only_integer: true }
  validates :name, presence: true
end
