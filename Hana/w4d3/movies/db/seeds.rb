# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Category.create(name: 'Action')
c2 = Category.create(name: 'Classics')
c3 = Category.create(name: 'Comedy')
c4 = Category.create(name: 'Romance')
c5 = Category.create(name: 'Documentary')
c6 = Category.create(name: 'Drama')
c7 = Category.create(name: 'Sci-Fi')
c8 = Category.create(name: 'Fantasy')
c9 = Category.create(name: 'Foreign')


m1 = Movie.create(title: "American Hustle", rating: 6.5, review: "Extraordinary claims require extraordinary evidence. Venture a still more glorious dawn awaits Flatland. Kindling the energy hidden in matter ship of the imagination, preserve and cherish that pale blue dot stirred by starlight from which we spring! A still more glorious dawn awaits. Emerged into consciousness. Circumnavigated corpus callosum laws of physics a very small stage in a vast cosmic arena permanence of the stars rich in heavy atoms Cambrian explosion as a patch of light encyclopaedia galactica galaxies extraordinary claims require extraordinary evidence made in the interiors of collapsing stars galaxies. Great turbulent clouds.", venue: "Apple TV", category_ids: [c1.id, c2.id, c3.id])
m2 = Movie.create(title: "Gravity", rating: 8, review: "Extraordinary claims require extraordinary evidence. Venture a still more glorious dawn awaits Flatland. Kindling the energy hidden in matter ship of the imagination, preserve and cherish that pale blue dot stirred by starlight from which we spring! A still more glorious dawn awaits. Emerged into consciousness. Circumnavigated corpus callosum laws of physics a very small stage in a vast cosmic arena permanence of the stars rich in heavy atoms Cambrian explosion as a patch of light encyclopaedia galactica galaxies extraordinary claims require extraordinary evidence made in the interiors of collapsing stars galaxies. Great turbulent clouds.", venue: "Theater", category_ids: [c2.id, c3.id, c4.id, c5.id])
m3 = Movie.create(title: "Wolf of Wall Street", rating: 8, review: "Extraordinary claims require extraordinary evidence. Venture a still more glorious dawn awaits Flatland. Kindling the energy hidden in matter ship of the imagination, preserve and cherish that pale blue dot stirred by starlight from which we spring! A still more glorious dawn awaits. Emerged into consciousness. Circumnavigated corpus callosum laws of physics a very small stage in a vast cosmic arena permanence of the stars rich in heavy atoms Cambrian explosion as a patch of light encyclopaedia galactica galaxies extraordinary claims require extraordinary evidence made in the interiors of collapsing stars galaxies. Great turbulent clouds.", venue: "Apple TV", category_ids: [c4.id, c5.id, c6.id, c7.id, c8.id])