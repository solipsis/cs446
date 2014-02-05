# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pet.create!(name: 'Maya', species: 'Dog', image_url: 'maya.jpg', age: 12)

Pet.create!(name: 'Fargo', species: 'Parakeet', image_url: 'fargo.jpg', age: 9)

Pet.create!(name: 'Bob', species: 'T-Rex', image_url: 'bob.png', age:17)