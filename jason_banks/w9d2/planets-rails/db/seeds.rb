# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

planets = Planet.create([
  {name: 'Earth', mass: '1 Earth mass', age: '4.54 billion years', moons: 1},
  {name: 'Neptune', mass: '17.15 Earth mass', age: '4.5 billion years', moons: 13},
  {name: 'PSR B1620-26 b', mass: '795 Earth mass', age: '13 billion years', moons: 0}
  ])

stars = Star.create([
  {name: 'The Sun', mass: '333,000 Earth mass', age: '4.6 billion years', classification: 'G2V', luminosity: '3.75×10^28 lm'},
  {name: 'Sirius', mass: '2.02 Earth mass', age: '2–3 x 10^8 years', classification: 'A1V', luminosity: '25.4 L'},
  {name: 'Vega', mass: '2.135 +/- 0.074 Earth mass', age: '455 +/- 13 million years', classification: 'A0Va', luminosity: '40.12 +/- 0.45 L'}
  ])
