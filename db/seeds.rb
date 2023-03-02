# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: "Ressourcerie", last_name: "Le Poulpe", email: "ressourcerielepoulpe@gmail.com", role:"Donateur", password:"azerty", address: "4 Bis Rue d'Oran, 75018 Paris, France")
User.create(first_name: "Adrien", last_name: "Boudin", email: "adrien@gmail.com", role:"Demandeur", password:"azerty")
User.create(first_name: "Margaux", last_name: "Dupont", email: "margaux@gmail.com", role:"Donateur", password:"azerty")
User.create(first_name: "John", last_name: "Test", email: "john@test.com", role: "Demandeur", password: "azerty")

Chatroom.create(name: "Messagerie Donateur")
Chatroom.create(name: "Messagerie Demandes")
