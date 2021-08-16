# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

c1 = Cat.create(birth_date: "1991/01/11", color: "blue", name: "Darrick", sex: "M", description: "Very handsome cat")
c2 = Cat.create(birth_date: "1996/07/09", color: "black", name: "Kent", sex: "M", description: "Very sexy cat")

rental1 = CatRentalRequest.create(cat_id: c1.id, start_date: "2021/08/13", end_date: "2021/08/18", status: 'APPROVED')
rental2 = CatRentalRequest.create(cat_id: c2.id, start_date: "2021/08/13", end_date: "2021/08/18")