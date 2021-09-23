# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

b1 = Bench.create({description: 'bench of greatness', lat: 37.76, lng: -122.45})

b2 = Bench.create({description: 'bench of sorrow', lat: 37.73, lng: -122.46})

b3 = Bench.create({description: 'the god bench', lat: 37.79, lng: -122.48})

b4 = Bench.create({description: 'the hidden bench', lat: 37.81, lng: -122.41})