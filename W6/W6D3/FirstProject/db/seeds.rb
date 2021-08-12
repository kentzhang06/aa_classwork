# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Artwork.delete_all
ArtworkShare.delete_all

user1 = User.create(username: 'DamianLechoszest')
user2 = User.create(username: 'Carivory')
user3 = User.create(username: 'HenryTungsten')
user4 = User.create(username: 'testuser4')

artwork1 = Artwork.create(title: 'Summer Nostalgia', image_url: 'https://i.imgur.com/gSLqTub.jpg', artist_id: user1.id)
artwork2 = Artwork.create(title: 'Day Off', image_url: 'https://i.imgur.com/tbVf6dJ.jpg', artist_id: user2.id)
artwork3 = Artwork.create(title: 'Teacup Pig', image_url: 'https://i.redd.it/wiaqbwrgg2w61.png',artist_id: user3.id)

share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user3.id)
share2 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user4.id)

