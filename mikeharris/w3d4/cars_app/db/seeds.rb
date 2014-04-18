# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Engine.create(fuel: "petrol", size: 1.2)
Engine.create(fuel: "petrol", size: 1.3)
Engine.create(fuel: "petrol", size: 1.4)
Engine.create(fuel: "petrol", size: 2.0)
Engine.create(fuel: "diesel", size: 1.1)
Engine.create(fuel: "diesel", size: 1.2)


Car.create(name: "Fiesta", colour: "red", max_speed: 100, engine_id: 1)
Car.create(name: "Ferrari", colour: "red", max_speed: 130, engine_id: 3)
Car.create(name: "VW", colour: "blue", max_speed: 105)
Car.create(name: "VW", colour: "pink", max_speed: 105)
Car.create(name: "Nissan", colour: "blue", max_speed: 120)

