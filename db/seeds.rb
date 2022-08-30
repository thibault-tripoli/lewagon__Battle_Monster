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

puts "creation de personnage..."

player_one = User.create!(email: "thibault@battle.com", password: "123456", name: "Thibault")
player_two = User.create!(email: "tarek@battle.com", password: "123456", name: "Tarek")

puts " creation du bestiaire"

specie_one = Specie.create!(name: "Garou")
specie_two = Specie.create!(name: "Golem")

Attack.create!(damage: 25, name: "griffure sanglante", specie_id: specie_one.id)
Attack.create!(damage: 25, name: "jets de pierres", specie_id: specie_two.id)

puts "creation des stars du jeu..."
Monster.create!(name: "billy crawford", user_id: player_one.id, specie_id: specie_one.id, xp: 0)
Monster.create!(name: "durdur", user_id: player_two.id, specie_id: specie_two.id, xp: 0)

puts " creation de votre pasteque euhhh de votre arene"
