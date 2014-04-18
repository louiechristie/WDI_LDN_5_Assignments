# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create(make: 'Vauxhall', model: 'Astra', color: 'red')
Car.create(make: 'Ford', model: 'Escort', color: 'blue')
Car.create(make: 'Citroen', model: 'Zara', color: 'green')

Engine.create(power: '120', cylinders: '4', fuel: 'petrol')
Engine.create(power: '150', cylinders: '6', fuel: 'deisel')
Engine.create(power: '100', cylinders: '4', fuel: 'unleaded')