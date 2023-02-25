# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: "Ressourcerie", last_name: "Le Poulpe", email: "ressourcerielepoulpe@gmail.com", role:"Donateur", password:"azerty", address: "4 Bis Rue d'Oran, 75018 Paris, France")
User.create(first_name: "Jean Michel", last_name: "Boudin", email: "michmich@gmail.com", role:"Demandeur", password:"azerty")
User.create(first_name: "Marie", last_name: "Dupont", email: "mariedupont@gmail.com", role:"Donateur", password:"azerty")

Chatroom.create(name: "General Donateur")
Chatroom.create(name: "General Demandeur")
