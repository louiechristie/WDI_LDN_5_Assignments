# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  ingredients = Ingredient.create(name:'Milk')
  ingredients = Ingredient.create(name:'Salt')
  ingredients = Ingredient.create(name:'Honey')
  ingredients = Ingredient.create(name:'Egg')

  categories = Category.create(name:'Starter')
  categories = Category.create(name:'Main')
  categories = Category.create(name:'Desert')