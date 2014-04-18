# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Main')
Category.create(name: 'Starter')
Category.create(name: 'Dessert')
Category.create(name: 'Breakfast')
Category.create(name: 'Snack')

Recipe.create(name: 'Scrambled Eggs', description: 'prepare eggs and scramble them', feeds_people: 2, category_id: 4)
Recipe.create(name: 'Cesars Salad', description: 'slice ingredients and mix them', feeds_people: 4, category_id: 5)

