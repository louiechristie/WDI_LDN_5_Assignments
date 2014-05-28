# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Planet.create(name: "Mercury", url: "http://upload.wikimedia.org/wikipedia/commons/3/30/Mercury_in_color_-_Prockter07_centered.jpg", moons: 0, diameter: "4879", temp: "167")
Planet.create(name: "Venus", url: "http://upload.wikimedia.org/wikipedia/commons/3/30/Mercury_in_color_-_Prockter07_centered.jpg", moons: 0, diameter: "12104", temp: "464")
Planet.create(name: "Mars", url: "http://upload.wikimedia.org/wikipedia/commons/3/30/Mercury_in_color_-_Prockter07_centered.jpg", moons: 0, diameter: "12756", temp: "15")
Star.create(name: "Proxima Centauri", url: "http://upload.wikimedia.org/wikipedia/commons/3/30/Mercury_in_color_-_Prockter07_centered.jpg", distance: "93", luminosity: "98")
Star.create(name: "Pollux", url: "http://upload.wikimedia.org/wikipedia/commons/3/30/Mercury_in_color_-_Prockter07_centered.jpg", distance: "96.54", luminosity: "43")
Star.create(name: "Betelgeuse", url: "http://upload.wikimedia.org/wikipedia/commons/3/30/Mercury_in_color_-_Prockter07_centered.jpg", distance: "643", luminosity: "120000")

