# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Attack.destroy_all
Monster.destroy_all
User.destroy_all
Specie.destroy_all
Deck.destroy_all
Battle.destroy_all

puts "creation des joueurs..."
base_url = 'https://onepage.dropagence.fr/game/bm/img/static'

player1_avatar_url = URI.open("#{base_url}/ilyes.jpg")
player2_avatar_url = URI.open("#{base_url}/tarek.jpg")
player3_avatar_url = URI.open("#{base_url}/arnold.jpg")
player4_avatar_url = URI.open("#{base_url}/thibault.jpg")
player5_avatar_url = URI.open("#{base_url}/jonathan.jpg")

player_one = User.new(email: "ilyes@battle.com", password: "123456", name: "Ilyes", pc: 0, onboard: false)
player_two = User.new(email: "tarek@battle.com", password: "123456", name: "Tarek", pc: 0, onboard: true)
player_three = User.new(email: "arnold@battle.com", password: "123456", name: "Arnold", pc: 0, onboard: true)
player_four = User.new(email: "thibault@battle.com", password: "123456", name: "Thibault", pc: 0, onboard: false)
player_five = User.new(email: "jonathan@battle.com", password: "123456", name: "Jonathan", pc: 0, onboard: false)

player_one.avatar.attach(io: player1_avatar_url, filename: 'ilyes_avatar.jpg', content_type: 'image/jpg')
player_two.avatar.attach(io: player2_avatar_url, filename: 'tarek_avatar.jpg', content_type: 'image/jpg')
player_three.avatar.attach(io: player3_avatar_url, filename: 'arnold_avatar.jpg', content_type: 'image/jpg')
player_four.avatar.attach(io: player4_avatar_url, filename: 'thibault_avatar.jpg', content_type: 'image/jpg')
player_five.avatar.attach(io: player5_avatar_url, filename: 'jonathan_avatar.jpg', content_type: 'image/jpg')

player_one.save!
player_two.save!
player_three.save!
player_four.save!
player_five.save!

puts "creation du bestiaire"

monster_url = 'https://onepage.dropagence.fr/game/bm/img/static/specie'
specie_one = Specie.create!(name: "golem", monster_skin: "#{monster_url}/golem.png", monster_head: "#{monster_url}/golem-head.png", info: "Tu te sens l’âme d’un Gollum sous testo, c’est par ici!")
specie_two = Specie.create!(name: "garou", monster_skin: "#{monster_url}/garou.png", monster_head: "#{monster_url}/garou-head.png", info: "Tu kiffes Taylor Lautner, le garou est fait pour toi!")
specie_three = Specie.create!(name: "troll", monster_skin: "#{monster_url}/troll.png", monster_head: "#{monster_url}/troll-head.png", info: "Twitter est ton Dieu, impose tes idées bienveillantes à coup de bâton!")

attack_url = 'https://onepage.dropagence.fr/game/bm/img/static/attack'

Attack.create!(damage: 10, success: 100, name: "Kevin", specie_id: specie_one.id, attack_skin: "#{attack_url}/1.png", attack_btn: "#{attack_url}/btn/1.png", image_num: 1)
Attack.create!(damage: 20, success: 80, name: "Jet de Pierre", specie_id: specie_one.id, attack_skin: "#{attack_url}/2.png", attack_btn: "#{attack_url}/btn/1.png", image_num: 2)
Attack.create!(damage: 30, success: 60, name: "Pluie de cailloux", specie_id: specie_one.id, attack_skin: "#{attack_url}/3.png", attack_btn: "#{attack_url}/btn/1.png", image_num: 3)
Attack.create!(damage: 40, success: 40, name: "Pierre Feuille Ciseaux", specie_id: specie_one.id, attack_skin: "#{attack_url}/4.png", attack_btn: "#{attack_url}/btn/1.png", image_num: 4)
Attack.create!(damage: 50, success: 20, name: "Ferrero Rocher", specie_id: specie_one.id, attack_skin: "#{attack_url}/5.png", attack_btn: "#{attack_url}/btn/1.png", image_num: 5)

Attack.create!(damage: 30, success: 100, name: "Thriller", specie_id: specie_two.id, attack_skin: "#{attack_url}/6.png", attack_btn: "#{attack_url}/btn/6.png", image_num: 6)
Attack.create!(damage: 30, success: 100, name: "Griffure sanglante", specie_id: specie_two.id, attack_skin: "#{attack_url}/7.png", attack_btn: "#{attack_url}/btn/7.png", image_num: 7)
Attack.create!(damage: 30, success: 100, name: "Croc blanc", specie_id: specie_two.id, attack_skin: "#{attack_url}/8.png", attack_btn: "#{attack_url}/btn/8.png", image_num: 8)
Attack.create!(damage: 30, success: 100, name: "Meute enragée", specie_id: specie_two.id, attack_skin: "#{attack_url}/9.png", attack_btn: "#{attack_url}/btn/9.png", image_num: 9)
Attack.create!(damage: 30, success: 100, name: "Powerwolf", specie_id: specie_two.id, attack_skin: "#{attack_url}/10.png", attack_btn: "#{attack_url}/btn/10.png", image_num: 10)

Attack.create!(damage: 30, success: 100, name: "Baton Toodur", specie_id: specie_three.id, attack_skin: "#{attack_url}/11.png", attack_btn: "#{attack_url}/btn/11.png", image_num: 11)
Attack.create!(damage: 20, success: 0, name: "Boom Boom", specie_id: specie_three.id, attack_skin: "#{attack_url}/12.png", attack_btn: "#{attack_url}/btn/12.png", image_num: 12)
Attack.create!(damage: 30, success: 60, name: "Lancé de hache", specie_id: specie_three.id, attack_skin: "#{attack_url}/13.png", attack_btn: "#{attack_url}/btn/13.png", image_num: 13)
Attack.create!(damage: 40, success: 40, name: "Hypertroll", specie_id: specie_three.id, attack_skin: "#{attack_url}/14.png", attack_btn: "#{attack_url}/btn/14.png", image_num: 14)
Attack.create!(damage: 100, success: 100, name: "Erreur 500", specie_id: specie_three.id, attack_skin: "#{attack_url}/15.png", attack_btn: "#{attack_url}/btn/15.png", image_num: 15)

puts "creation des stars du jeu..."
# _monster_one = Monster.create!(name: "Toktok", user_id: player_one.id, specie_id: specie_three.id)
_monster_two = Monster.create!(name: "Jackson", user_id: player_two.id, specie_id: specie_two.id)
_monster_three = Monster.create!(name: "Michael", user_id: player_three.id, specie_id: specie_two.id)

puts "Tout a été créé avec succès !"
