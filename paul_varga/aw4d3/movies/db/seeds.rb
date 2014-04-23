# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Action')
Category.create(name: 'Comedy')
Category.create(name: 'Drama')
Category.create(name: 'Horror')

Movie.create(name: 'The Empire Strikes Back', review: 'The Empire Strikes Back, later released as Star Wars Episode V: The Empire Strikes Back, is a 1980 American epic space opera film directed by Irvin Kershner, produced by Gary Kurtz, and written by Leigh Brackett and Lawrence Kasdan, with George Lucas writing the film`s story and serving as executive producer. Of the six main Star Wars films, it was the second to be released and the fifth in terms of internal chronology.', rating: 10, year: 1980 )
Movie.create(name: 'A Love Song for Bobby Long', review: 'A Love Song for Bobby Long is a 2004 American drama film written and directed by Shainee Gabel. The screenplay is based on the novel Off Magazine Street by Ronald Everett Capps.', rating: 9, year: 2004 )