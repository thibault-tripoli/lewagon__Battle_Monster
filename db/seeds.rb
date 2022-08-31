# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Attack.destroy_all
Monster.destroy_all
User.destroy_all
Specie.destroy_all
Deck.destroy_all
Battle.destroy_all

puts "creation de personnage..."

player_one = User.create!(email: "thibault@battle.com", password: "123456", name: "Thibault")
player_two = User.create!(email: "tarek@battle.com", password: "123456", name: "Tarek")

puts "creation du bestiaire"

specie_one = Specie.create!(name: "Garou")
specie_two = Specie.create!(name: "Golem")

attack_one = Attack.create!(damage: 25, name: "griffure sanglante", specie_id: specie_one.id)
attack_two = Attack.create!(damage: 25, name: "jets de pierres", specie_id: specie_two.id)

puts "creation des stars du jeu..."
monster_one = Monster.create!(name: "billy crawford", user_id: player_one.id, specie_id: specie_one.id, xp: 0)
monster_two =Monster.create!(name: "durdur", user_id: player_two.id, specie_id: specie_two.id, xp: 0)

puts "creation d'une battle + 2 decks"
battle = Battle.new(pc_win: 500, xp_win: 150, status: "pending", round: 1)
deck1 = Deck.create!(user: player_one, monster: monster_one, attack: attack_one, battle: battle, hp: 100)
_deck2 = Deck.create!(user: player_two, monster: monster_two, attack: attack_two, battle: battle, hp: 100)
battle.current_deck = deck1
battle.save!

puts "Tout a été créé avec succès !"
