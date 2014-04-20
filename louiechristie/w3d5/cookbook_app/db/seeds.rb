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

Recipe.create(name: 'Pancakes', category_id: 2, feeds: 2)
Recipe.create(name: 'Omlette', category_id: 2, feeds: 2)
Recipe.create(name: 'Jacket Potato', category_id: 2, feeds: 2)

Ingredient.create(name: 'Eggs')
Ingredient.create(name: 'Milk')
Ingredient.create(name: 'Flour')

Recipe.find(1).ingredients << Ingredient.find(1)
Recipe.find(1).ingredients << Ingredient.find(2)
Recipe.find(1).ingredients << Ingredient.find(3)

Recipe.find(2).ingredients << Ingredient.find(1)