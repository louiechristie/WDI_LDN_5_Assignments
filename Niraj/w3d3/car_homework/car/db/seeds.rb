# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

engines = Engine.create(name:'Mercedes') 
engines = Engine.create(name:'Ferrari') 
engines = Engine.create(name:'Renault Faultmatique') 
engines = Engine.create(name:'Malheureusemen') 
engines = Engine.create(name:'Renault') 


names = Name.create ({name: 'Ferrari'})
names = Name.create(name:'John') 
