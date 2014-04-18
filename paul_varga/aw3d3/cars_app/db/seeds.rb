# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create(name: 'Ligthning McQueen', color: 'red', year: 1956)
Car.create(name: 'Doc Hudson', color: 'darkblue', year: 1951)
Car.create(name: 'Sally Carrera', color: 'lightblue', year: 2002)
Engine.create(cylinders: 'V6', name: 'Green', fuel_type: 'electro', power: 120 )
Engine.create(cylinders: 'V12', name: 'Superspeed', fuel_type: 'kerosin', power: 520 )
