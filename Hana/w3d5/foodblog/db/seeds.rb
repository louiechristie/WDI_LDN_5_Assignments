# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


c1 = Category.create(name: 'March')
c2 = Category.create(name: 'April')
c3 = Category.create(name: 'May')
c4 = Category.create(name: 'June')


i1 = Ingredient.create(name: "Eggs")
i2 = Ingredient.create(name: "Milk")
i3 = Ingredient.create(name: "Sugar")
i4 = Ingredient.create(name: "Flour")
i5 = Ingredient.create(name: "Butter")
i6 = Ingredient.create(name: "Salt")


Recipe.create(category_id: c1.id, name: "Triple Berry Dutch Baby", instructions:"Isdfjejsdljfei", servings: 4, url: "http://joythebaker.com/2014/04/triple-berry-dutch-baby/", image: "https://farm8.staticflickr.com/7277/13835766643_8d79a6114e_c.jpg", ingredient_ids: [1,2,3,4])
Recipe.create(category_id: c1.id, name: "Rye Shortcakes with Strawberries and Rhubarb", instructions:"LSDFjij", servings: 8, url: "http://food52.com/recipes/27868-rye-shortcakes-with-roasted-strawberries-and-rhubarb", image: "http://d2k9njawademcf.cloudfront.net/indeximages/41807/full/rye_shortcakes_with_roasted_strawberries_and_rhubarb_(yossy_arefi)-9.jpg?1397664867", ingredient_ids: [1,2,3,4])
Recipe.create(category_id: c2.id, name: "Gluten Free Sponge Cake", instructions:"slefjidf", servings: 8, url: "http://food52.com/recipes/27584-gluten-free-sponge-cake")
Recipe.create(category_id: c2.id, name: "Roasted Brussels Sprouts and Crispy Baked Tofu with Honey-Sesame Glaze", instructions:"igijefjil", servings: 5, url: "http://cookieandkate.com/2014/roasted-brussels-sprouts-and-crispy-baked-tofu-with-honey-sesame-glaze/")
Recipe.create(category_id: c3.id, name: "Peach Tart", instructions:"ldsbllknl", servings: 8, url: "http://food52.com/recipes/14217-peach-tart")
Recipe.create(category_id: c3.id, name: "Lazy Mary's Lemon Tart", instructions:"sdfoergo", servings: 8, url: "http://food52.com/recipes/1374-lazy-mary-s-lemon-tart")
Recipe.create(category_id: c4.id, name: "Brown Butter Cupcake Brownies", instructions:"sdfoergo", servings: 8, url: "http://food52.com/recipes/26696-brown-butter-cupcake-brownies")
Recipe.create(category_id: c4.id, name: "Magical Marvelous Memorable Cookies", instructions:"sdfoergo", servings: 24, url: "http://food52.com/recipes/8595-magical-marvelous-memorable-cookies")
Recipe.create(category_id: c1.id, name: "Warm and Gooey Citrus Pudding", instructions:"sdfoergo", servings: 24, url: "http://food52.com/recipes/15691-warm-gooey-citrus-pudding", image: 'http://d2k9njawademcf.cloudfront.net/indeximages/31002/full/food52_02-12-13-5849.jpg?1380098302')












