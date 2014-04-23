# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Car.create(description: "Convertible, nice sports car", make: "Ford", mileage: "20000", model: "Mustang", year: "2009")
Car.create(description: "Sedan, but high performance", make: "BMW", mileage: "30000", model: "M5", year: "2002")
Car.create(description: "Expensive sports car; sophisticated", make: "Mercedes-Benz", mileage: "40000", model: "SLK", year: "2010")
Car.create(description: "The Porche SUV", make: "Porche", mileage: "50000", model: "Cayenne", year: "2005")
Car.create(description: "An un-needingly large vehicle", make: "GM", mileage: "60000", model: "Tahoe", year: "2012")


Engine.create(fuel_type: "petrol", power: "500")
Engine.create(fuel_type: "petrol", power: "400")
Engine.create(fuel_type: "electricity", power: "100")