# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

Contract.destroy_all
Monster.destroy_all
User.destroy_all

puts "Creating DataBase"
puts "Creating Ilyes_user....bip bip....."

base_url = 'http://onepage.dropagence.fr/game/place'
# ilyes
ilyes_avatar_url = URI.open("#{base_url}/ilyes.jpg")
ilyes_user = User.new(
  email: "ilyes@battle.com",
  password: "123456",
  name: "Ilyes",
  coin: 500
)
ilyes_user.avatar.attach(io: ilyes_avatar_url, filename: 'ilyes.jpg', content_type: 'image/jpg')
ilyes_user.save!

specie_ilyes_monster1 = "golem"
avatar_ilyes_monster1 = URI.open("#{base_url}/#{specie_ilyes_monster1}-1-1.png")
ilyes_monster1 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_ilyes_monster1.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 6,
  price: 4,
  user_id: ilyes_user.id
)
ilyes_monster1.image.attach(io: avatar_ilyes_monster1, filename: "#{ilyes_monster1.name}.png", content_type: 'image/png')
ilyes_monster1.save

specie_ilyes_monster2 = "golem"
avatar_ilyes_monster2 = URI.open("#{base_url}/#{specie_ilyes_monster2}-2-1.png")
ilyes_monster2 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_ilyes_monster2.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 11,
  price: 12,
  user_id: ilyes_user.id
)
ilyes_monster2.image.attach(io: avatar_ilyes_monster2, filename: "#{ilyes_monster2.name}.png", content_type: 'image/png')
ilyes_monster2.save

specie_ilyes_monster3 = "garou"
avatar_ilyes_monster3 = URI.open("#{base_url}/#{specie_ilyes_monster3}-1-2.png")
ilyes_monster3 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_ilyes_monster3.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 9,
  price: 10,
  user_id: ilyes_user.id
)
ilyes_monster3.image.attach(io: avatar_ilyes_monster3, filename: "#{ilyes_monster3.name}.png", content_type: 'image/png')
ilyes_monster3.save

specie_ilyes_monster4 = "troll"
avatar_ilyes_monster4 = URI.open("#{base_url}/#{specie_ilyes_monster4}-2-2.png")
ilyes_monster4 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_ilyes_monster4.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 18,
  price: 30,
  user_id: ilyes_user.id
)
ilyes_monster4.image.attach(io: avatar_ilyes_monster4, filename: "#{ilyes_monster4.name}.png", content_type: 'image/png')
ilyes_monster4.save

puts "Profile Ilyes_user.......has been created."
puts "Creating Jonathan_user....bip bip....."

# Jonathan
john_avatar_url = URI.open("#{base_url}/jonathan.jpg")
john_user = User.new(
  email: "jonathan@battle.com",
  password: "123456",
  name: "Jonathan",
  coin: 500
)
john_user.avatar.attach(io: john_avatar_url, filename: 'jonathan.jpg', content_type: 'image/jpg')
john_user.save!

specie_john_monster1 = "garou"
avatar_john_monster1 = URI.open("#{base_url}/#{specie_john_monster1}-2-1.png")
john_monster1 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_john_monster1.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 20,
  price: 50,
  user_id: john_user.id
)
john_monster1.image.attach(io: avatar_john_monster1, filename: "#{john_monster1.name}.png", content_type: 'image/png')
john_monster1.save

specie_john_monster2 = "troll"
avatar_john_monster2 = URI.open("#{base_url}/#{specie_john_monster2}-1-1.png")
john_monster2 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_john_monster2.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 2,
  price: 1,
  user_id: john_user.id
)
john_monster2.image.attach(io: avatar_john_monster2, filename: "#{john_monster2.name}.png", content_type: 'image/png')
john_monster2.save

specie_john_monster3 = "troll"
avatar_john_monster3 = URI.open("#{base_url}/#{specie_john_monster3}-1-2.png")
john_monster3 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_john_monster3.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: false,
  level: 3,
  price: 2,
  user_id: john_user.id
)
john_monster3.image.attach(io: avatar_john_monster3, filename: "#{john_monster3.name}.png", content_type: 'image/png')
john_monster3.save

specie_john_monster4 = "garou"
avatar_john_monster4 = URI.open("#{base_url}/#{specie_john_monster4}-1-2.png")
john_monster4 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_john_monster4.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 6,
  price: 4,
  user_id: john_user.id
)
john_monster4.image.attach(io: avatar_john_monster4, filename: "#{john_monster4.name}.png", content_type: 'image/png')
john_monster4.save

puts "Profile Jonathan_user.......has been created."
puts "Creating Thibault_user....bip bip....."

# Thibault
thibault_avatar_url = URI.open("#{base_url}/thibault.jpg")
thibault_user = User.new(
  email: "thibault@battle.com",
  password: "123456",
  name: "Thibault",
  coin: 500
)
thibault_user.avatar.attach(io: thibault_avatar_url, filename: 'thibault.jpg', content_type: 'image/jpg')
thibault_user.save!

specie_thibault_monster1 = "garou"
avatar_thibault_monster1 = URI.open("#{base_url}/#{specie_thibault_monster1}-2-1.png")
thibault_monster1 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_thibault_monster1.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 12,
  price: 15,
  user_id: thibault_user.id
)
thibault_monster1.image.attach(io: avatar_thibault_monster1, filename: "#{thibault_monster1.name}.png", content_type: 'image/png')
thibault_monster1.save

specie_thibault_monster2 = "golem"
avatar_thibault_monster2 = URI.open("#{base_url}/#{specie_thibault_monster2}-2-2.png")
thibault_monster2 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_thibault_monster2.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 12,
  price: 14,
  user_id: thibault_user.id
)
thibault_monster2.image.attach(io: avatar_thibault_monster2, filename: "#{thibault_monster2.name}.png", content_type: 'image/png')
thibault_monster2.save

specie_thibault_monster3 = "golem"
avatar_thibault_monster3 = URI.open("#{base_url}/#{specie_thibault_monster3}-2-1.png")
thibault_monster3 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_thibault_monster3.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 15,
  price: 23,
  user_id: thibault_user.id
)
thibault_monster3.image.attach(io: avatar_thibault_monster3, filename: "#{thibault_monster3.name}.png", content_type: 'image/png')
thibault_monster3.save

puts "Profile Thibault_user.......has been created."
puts "Creating Tarek_user....bip bip....."

# Tarek
tarek_avatar_url = URI.open("#{base_url}/tarek.jpg")
tarek_user = User.new(
  email: "tarek@battle.com",
  password: "123456",
  name: "Tarek",
  coin: 80
)
tarek_user.avatar.attach(io: tarek_avatar_url, filename: 'tarek.jpg', content_type: 'image/jpg')
tarek_user.save!

specie_tarek_monster1 = "golem"
avatar_tarek_monster1 = URI.open("#{base_url}/#{specie_tarek_monster1}-1-2.png")
tarek_monster1 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_tarek_monster1.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 8,
  price: 5,
  user_id: tarek_user.id
)
tarek_monster1.image.attach(io: avatar_tarek_monster1, filename: "#{tarek_monster1.name}.png", content_type: 'image/png')
tarek_monster1.save

specie_tarek_monster2 = "garou"
avatar_tarek_monster2 = URI.open("#{base_url}/#{specie_tarek_monster2}-1-2.png")
tarek_monster2 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_tarek_monster2.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: false,
  level: 7,
  price: 6,
  user_id: tarek_user.id
)
tarek_monster2.image.attach(io: avatar_tarek_monster2, filename: "#{tarek_monster2.name}.png", content_type: 'image/png')
tarek_monster2.save

specie_tarek_monster3 = "troll"
avatar_tarek_monster3 = URI.open("#{base_url}/#{specie_tarek_monster3}-1-2.png")
tarek_monster3 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_tarek_monster3.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: true,
  level: 7,
  price: 6,
  user_id: tarek_user.id
)
tarek_monster3.image.attach(io: avatar_tarek_monster3, filename: "#{tarek_monster3.name}.png", content_type: 'image/png')
tarek_monster3.save

specie_tarek_monster4 = "troll"
avatar_tarek_monster4 = URI.open("#{base_url}/#{specie_tarek_monster4}-2-1.png")
tarek_monster4 = Monster.new(
  name: Faker::Games::Pokemon.name,
  specie: specie_tarek_monster4.to_s,
  description: Faker::Lorem.sentence(word_count: 15),
  actif: false,
  level: 11,
  price: 10,
  user_id: tarek_user.id
)
tarek_monster4.image.attach(io: avatar_tarek_monster4, filename: "#{tarek_monster4.name}.png", content_type: 'image/png')
tarek_monster4.save

puts "Profile Tarek_user.......has been created."

Contract.create!(
  battles: Faker::Commerce.price(range: 1..5).to_i,
  actif: true,
  monster_id: thibault_monster2.id,
  user_id: ilyes_user.id
)

Contract.create!(
  battles: Faker::Commerce.price(range: 1..5).to_i,
  actif: true,
  monster_id: tarek_monster3.id,
  user_id: ilyes_user.id
)

Contract.create!(
  battles: Faker::Commerce.price(range: 1..5).to_i,
  actif: true,
  monster_id: tarek_monster1.id,
  user_id: john_user.id
)

Contract.create!(
  battles: Faker::Commerce.price(range: 1..5).to_i,
  actif: true,
  monster_id: ilyes_monster2.id,
  user_id: thibault_user.id
)

puts "All operations done....."
puts "DataBase created....You're all set to go bro !"
