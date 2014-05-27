# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Planet.create name: 'Mercury', volume: '0.056', url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Mercury_in_color_-_Prockter07_centered.jpg/405px-Mercury_in_color_-_Prockter07_centered.jpg'

Planet.create name: 'Earth', volume: '1', url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Earth_Eastern_Hemisphere.jpg/450px-Earth_Eastern_Hemisphere.jpg'

Planet.create name: 'Venus', volume: '0.866', url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Venus_globe.jpg/375px-Venus_globe.jpg'

Planet.create name: 'Jupiter', volume: '1321.3', url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Jupiter_by_Cassini-Huygens.jpg/390px-Jupiter_by_Cassini-Huygens.jpg'