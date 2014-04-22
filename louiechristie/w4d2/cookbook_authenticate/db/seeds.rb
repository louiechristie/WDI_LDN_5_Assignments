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

Recipe.create(name: 'Pancakes', category_id: 2, feeds: 4)
Recipe.create(name: 'Omlette', category_id: 2, feeds: 1)
Recipe.create(name: 'Jacket Potato', category_id: 2, feeds: 1)

Ingredient.create(name: 'Eggs')
Ingredient.create(name: 'Milk')
Ingredient.create(name: 'Flour')
Ingredient.create(name: 'Potato')

IngredientsRecipe.create(ingredient_id: 1, measure: "whole", quantity: 2, recipe_id: 1)
IngredientsRecipe.create(ingredient_id: 2, measure: "ml", quantity: 300, recipe_id: 1)
IngredientsRecipe.create(ingredient_id: 3, measure: "g", quantity: 100, recipe_id: 1)

IngredientsRecipe.create(ingredient_id: 1, measure: "whole", quantity: 2, recipe_id: 2)

IngredientsRecipe.create(ingredient_id: 4, measure: "large", quantity: 1, recipe_id: 3)

User.create(email: "admin", password: "password", password_confirmation: "password", role: "admin")
User.create(email: "user", password: "password", password_confirmation: "password")