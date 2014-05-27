# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Planet.create name: "Earth", mass: "5.97219×1024 kg", image: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Earth_Eastern_Hemisphere.jpg/300px-Earth_Eastern_Hemisphere.jpg", moons: 1
Planet.create name: "Venus", mass: "4.8676×10^24 kg", image: "http://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Venus_globe.jpg/250px-Venus_globe.jpg", moons: 0