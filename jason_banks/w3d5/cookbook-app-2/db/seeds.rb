# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


recipes = Recipe.create([
  { title:"This is why we can't have nice things w. Aliens", description:"Stop the kind aliens from fixing humanity's problems and ruining your profits", prep_time: 9, instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" },
  { title:"This is why we can't have nice things w. God(s)", description:"Holy salvation?! Not on your watch.", prep_time: 8, instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" },
  { title:"Total destruction, from mountain to shore", description:"Classic Gargamel", prep_time: 16, instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" },
  { title:"Zombie Apocalypse (voodoo)", description:"No one will see the voodoo that you will do so well coming.", prep_time: 14, instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" },
  { title:"Zombie Apocalypse (Umbrella Corp.)", description:"Any global conglomerate will do.", prep_time: 60, instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" },
  { title:"Vampire Apocalypse (Umbrella Corp.", description:"Any global conglomerate will do.", prep_time: 72, instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" },
  { title:"Demon Ascension", description:"This is a long game.", prep_time: 840 , instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" },
  { title:"Global Banking Failure", description:"Not for the faint of heart.", prep_time: 32 , instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" },
  { title:"Sharknado", description:"You're going to need a bigger boat.", prep_time: 840 , instructions: "Odd Future normcore synth plaid, Vice Godard literally flexitarian DIY slow-carb kale chips gentrify XOXO four loko. Kale chips Banksy gastropub, mumblecore fanny pack biodiesel cliche occupy squid letterpress farm-to-table organic 3 wolf moon.", image:"" }
 ])

ingredients = Ingredient.create([
  { name: "time machine" },
  { name: "crypto-currency" },
  { name: "puglistic extraterrestrials" },
  { name: "friendly extraterrestrials" },
  { name: "enriched uranium" },
  { name: "weapons grade plutonium" },
  { name: "genie-containing lamp" },
  { name: "mercenaries" },
  { name: "mad scientist(s)" },
  { name: "demi-gods" },
  { name: "God(s)" },
  { name: "bodies (dead or alive)" },
  { name: "hurricane" },
  { name: "earthquake" },
  { name: "one or more of the four horsemen" },
  { name: "horcrux" },
  { name: "dark magicks tome" },
  { name: "ninjas" },
  { name: "submarine" },
  { name: "rage virus" },
  { name: "ebola" }
  ])

categories = Category.create([
  { name: "Apocalypse", image: "apocalypse.jpg" },
  { name: "Biological Pandemic", image: "biological.jpg" },
  { name: "Economic Collapse", image: "economic-collapse.jpg" },
  { name: "General Pandemonium", image: "pandemonium.jpg" },
  { name: "Human Gullibility", image: "gullibility.jpg" },
  { name: "Natural Catastrophe", image: "sharknado.jpg" },
  { name: "Political Turmoil", image: "turmoil.jpg" }
  ])
