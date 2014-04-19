# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(name: 'March')
Category.create(name: 'April')
Category.create(name: 'May')
Category.create(name: 'June')

Recipe.create(category_id: 1, name: "Triple Berry Dutch Baby", instructions:"Isdfjejsdljfei", servings: 4, link: "http://joythebaker.com/2014/04/triple-berry-dutch-baby/")
Recipe.create(category_id: 1, name: "Rye Shortcakes with Strawberries and Rhubarb", instructions:"LSDFjij", servings: 8, link: "http://food52.com/recipes/27868-rye-shortcakes-with-roasted-strawberries-and-rhubarb")
Recipe.create(category_id: 2, name: "Gluten Free Sponge Cake", instructions:"slefjidf", servings: 8, link: "http://food52.com/recipes/27584-gluten-free-sponge-cake")
Recipe.create(category_id: 2, name: "Roasted Brussels Sprouts and Crispy Baked Tofu with Honey-Sesame Glaze", instructions:"igijefjil", servings: 5, link: "http://cookieandkate.com/2014/roasted-brussels-sprouts-and-crispy-baked-tofu-with-honey-sesame-glaze/")
Recipe.create(category_id: 3, name: "Peach Tart", instructions:"ldsbllknl", servings: 8, link: "http://food52.com/recipes/14217-peach-tart")
Recipe.create(category_id: 3, name: "Lazy Mary's Lemon Tart", instructions:"sdfoergo", servings: 8, link: "http://food52.com/recipes/1374-lazy-mary-s-lemon-tart")
Recipe.create(category_id: 4, name: "Brown Butter Cupcake Brownies", instructions:"sdfoergo", servings: 8, link: "http://food52.com/recipes/26696-brown-butter-cupcake-brownies")
Recipe.create(category_id: 4, name: "Magical Marvelous Memorable Cookies", instructions:"sdfoergo", servings: 24, link: "http://food52.com/recipes/8595-magical-marvelous-memorable-cookies")
