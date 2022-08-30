class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :monster, optional: true
  belongs_to :battle, optional: true
  belongs_to :attack, optional: true

  #est ce le bon validate je pense que celui correspond plus a ceux que l'on souhaite faire mais le winner???
  validates :hp, numericality: { only_integer: true }, presence: true
end
