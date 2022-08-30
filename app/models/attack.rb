class Attack < ApplicationRecord
  belongs_to :specie

  validates :damage, numericality: { only_integer: true }
  validates :name, presence: true
end
