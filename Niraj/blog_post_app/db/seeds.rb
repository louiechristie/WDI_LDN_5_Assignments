# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Category.delete_all
    BlogPost.delete_all
 
    categories = Category.create([
      { name: 'Current events' },
      { name: 'Cool category' }
    ])
 
    blogs = BlogPost.create([
      { title: 'Cool post', author: 'Michael Pavling', category_id: Category.first.id },
      { title: 'Much cooler post', author: 'Jonny Adshead', category_id: Category.last.id },
      { title: 'Another Cool post', author: 'Michael Pavling', category_id: Category.last.id },
      { title: 'Super cool', author: 'Michael Pavling', category_id: Category.first.id },
    ])