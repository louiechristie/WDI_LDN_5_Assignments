# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# movies = ["Seven", "Pulp Fiction"]
Movie.all.map{|movie| movie.actor_ids = [] }
Movie.all.map{|movie| movie.destroy }
Actor.all.map{|actor| actor.destroy }



Movie.create(title: "batman")
Movie.create(title: "pulp fiction")
Movie.create(title: "seven")
Movie.create(title: "true romance")
Movie.create(title: "grease")
Movie.create(title: "top gun")
Movie.create(title: "die hard")
Movie.create(title: "sixth sense")



