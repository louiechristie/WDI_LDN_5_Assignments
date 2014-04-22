# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.all.each {|category| category.destroy}
Ingredient.all.each  {|ingredient| ingredient.destroy}
Recipe.all.each  {|recipe| recipe.destroy}

starter = Category.create(name: "Starter")
main = Category.create(name: "Main")
dessert = Category.create(name: "Dessert")
snack = Category.create(name: "Snack")

eggs = Ingredient.create(name:"eggs").id
milk = Ingredient.create(name:"milk").id
butter = Ingredient.create(name:"butter").id
salt = Ingredient.create(name:"salt").id
cheese = Ingredient.create(name:"cheese").id
potatos = Ingredient.create(name:"potatos").id
rice = Ingredient.create(name:"rice").id
leek = Ingredient.create(name:"leek").id
chicken = Ingredient.create(name:"chicken").id
spinach = Ingredient.create(name:"spinach").id
rice = Ingredient.create(name:"rice").id
tomato = Ingredient.create(name:"tomato").id
chickpea = Ingredient.create(name:"chickpea").id
fish = Ingredient.create(name:"fish").id
bread = Ingredient.create(name:"bread").id
bacon = Ingredient.create(name:"bacon").id
cauliflower = Ingredient.create(name:"cauliflower").id

starter.recipes.create(name: "Scrambled Eggs", time: 15, feeds: 4, description: 
  "Whisked cooked eggs. Great with spinach" , ingredient_ids:  [eggs, milk, butter, salt, spinach])
starter.recipes.create(name: "Hummous", time: 5, feeds: 4, description: 
  "Dips serve with warm flatbread", ingredient_ids:  [chickpea, bread])
starter.recipes.create(name: "Tomato Soup", time: 10, feeds: 6, description:
  "Delicious red tomato soup. Serve with crusty farmhouse bread.", ingredient_ids:  [tomato, butter, bread])
main.recipes.create(name: "Roast Chicken", time: 90, feeds: 8, description: 
  "Roast chicken - ideal for cold winters days.", ingredient_ids:  [chicken, potatos,leek, butter])
main.recipes.create(name: "Fish Cakes", time: 25, feeds: 4, description: 
  "Cod and haddock pieces in breadcrumps", ingredient_ids:  [fish, bread])
main.recipes.create(name: "Cauliflower Cheese", time: 15, feeds: 4, description: 
  "Warm, creamy cauliflower cheese - best with bacon and tomato", ingredient_ids:  [cheese, milk, butter, cauliflower])
dessert.recipes.create(name: "Rice Pudding", time: 20, feeds: 4, description: 
  "Warm rice pudding in a creamy sauce - serve with jam.", ingredient_ids:  [rice, milk])
snack.recipes.create(name: "Crisps")
snack.recipes.create(name: "Chocolate Bar")







