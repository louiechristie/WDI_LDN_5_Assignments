# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

planets = Planet.create([
  {name: 'Earth', mass: '1 Earth mass', age: '4.54 billion years', moons: 1, image: 'http://ualr.edu/earthsciences/uploads/2009/01/whole_earth_small.jpg'},
  {name: 'Neptune', mass: '17.15 Earth mass', age: '4.5 billion years', moons: 13, image: 'http://4.bp.blogspot.com/-G0oBCw3EXNA/T7R3LTrVYyI/AAAAAAAAAKk/tPPFZZSw-t0/s200/neptune.jpg'},
  {name: 'PSR B1620-26 b', mass: '795 Earth mass', age: '13 billion years', moons: 0, image: 'http://media-cache-ec0.pinimg.com/236x/0e/5d/81/0e5d81405d58f1b74cc6b9b6b6c05b55.jpg'}
  ])

stars = Star.create([
  {name: 'The Sun', mass: '333,000 Earth mass', age: '4.6 billion years', classification: 'G2V', luminosity: '3.75×10^28 lm', image: 'http://2.bp.blogspot.com/-R6f01AwFqR8/UXqQohJFZGI/AAAAAAAABZw/jSnrclc-jF4/s200/latest_1024_0304.jpg'},
  {name: 'Sirius', mass: '2.02 Earth mass', age: '2–3 x 10^8 years', classification: 'A1V', luminosity: '25.4 L', image: 'http://www.jpl.nasa.gov/images/sim/sim-winter-200.jpg'},
  {name: 'Vega', mass: '2.135 +/- 0.074 Earth mass', age: '455 +/- 13 million years', classification: 'A0Va', luminosity: '40.12 +/- 0.45 L', image: 'http://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Vega_Spitzer.jpg/240px-Vega_Spitzer.jpg'}
  ])
