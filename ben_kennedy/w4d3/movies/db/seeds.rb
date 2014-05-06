# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


m = Movie.create(name: 'Jaws', review:'good', where_watched_id:1, user_id: 3)
m.omdb_pull
m.save
m = Movie.create(name: 'Saw', review:'ok', where_watched_id:1, user_id: 2)
m.omdb_pull
m.save
m = Movie.create(name: 'Pulp Fiction', review:'terrible', where_watched_id:1, user_id: 1)
m.omdb_pull
m.save

WhereWatched.create(location: 'cinema')
WhereWatched.create(location: 'tv')
WhereWatched.create(location:  'dvd (owned)')

User.create(email: 'test@test.com', password:'password', role:'admin')
User.create(email: 'test2@test.com', password:'password', role:'user')
User.create(email: 'test3@test.com', password:'password', role:'user')