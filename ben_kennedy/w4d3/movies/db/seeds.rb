# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Movie.create(name: 'movie 1', review:'good', where_watched_id:1, user_id: 3)
Movie.create(name: 'movie 2', review:'ok', where_watched_id:1, user_id: 2)
Movie.create(name: 'movie 3', review:'terrible', where_watched_id:1, user_id: 1)

WhereWatched.create(location: 'cinema')
WhereWatched.create(location: 'tv')
WhereWatched.create(location:  'dvd (owned)')

User.create(email: 'test@test.com', password:'password', role:'admin')
User.create(email: 'test2@test.com', password:'password', role:'user')
User.create(email: 'test3@test.com', password:'password', role:'user')