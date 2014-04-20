# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Starter')
Category.create(name: 'Main Course')
Category.create(name: 'Dessert')

Recipe.create(name: 'Pancakes')
Recipe.create(name: 'Omlette')
Recipe.create(name: 'Jacket Potato')