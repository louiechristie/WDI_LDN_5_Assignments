

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create(name:'Model S', make: 'Tesla', value: 69900, description: 'At the heart of the vehicle is the proven Tesla powertrain, delivering both unprecedented range and a thrilling drive experience.', image: 'http://www.teslamotors.com/sites/default/files/blog_images/hero_20140408a.jpg')
Car.create(name:'Yaris', make: 'Toyota', value:14430, description: 'Safe, cheap, small sub-compact car', image: 'http://www.samuipedia.com/wp-content/uploads/2012/05/Toyota-Yaris.jpg')
Car.create(name:'CEED GT', make: 'KIA', value:20500, description: 'Building upon the success of the multi-award winning Kia cee’d, the GT combines best in class technology with ultra sleek aesthetics to deliver a five-door hot hatch in a league of its own.', image: 'http://www.kia.co.uk/~/media/General%20Site%20Images/New_Cars/ceed%20GT/ceed_gt_630x358.ashx')