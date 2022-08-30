class Specie < ApplicationRecord
  has_many :monsters, dependent: :destroy
  has_many :attacks, dependent: :destroy

  validates :name, presence: true
end
