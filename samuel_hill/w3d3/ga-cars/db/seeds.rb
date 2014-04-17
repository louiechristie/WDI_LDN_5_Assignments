# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create(make: 'Ford', model: 'Fiesta', year: '2014', colour: 'Red', category: 'Compact')
Engine.create(fuel_type: 'Petrol', model:'Turbo', size: '1.6')
Engine.create(fuel_type: 'Diesel', model:'Turbo', size: '1.8')