# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create(make: 'BMW', year: '2008', color: 'Silver', category: 'coupe')
Car.create(make: 'Audi', year: '2009', color: 'Blue', category: 'sedan')
Car.create(make: 'Mercedes', year: '2010', color: 'Black', category: 'sedan')