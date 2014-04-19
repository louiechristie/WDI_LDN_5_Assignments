# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Starter")
Category.create(name: "Main")
Category.create(name: "Dessert")
Category.create(name: "Snack")


Recipe.create(name: "Scrambled Eggs", time: 15, feeds: 4, description: "whisked cooked eggs")
Recipe.create(name: "Hummous and description", time: 5, feeds: 4, description: "dips", catgory_id: 2)

