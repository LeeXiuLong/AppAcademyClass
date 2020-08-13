# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.destroy_all
Comment.destroy_all
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all


users = User.create!([{ username: 'Nahid'}, { username: 'Jourdan'}])
artworks = Artwork.create!([{title: 'Butterflies', image_url: 'Butterflies.png', artist_id:users[0].id}, {title: "Birds", image_url:"Bird.png", artist_id: users[1].id}])
artwork_shares = ArtworkShare.create!([{artwork_id: artworks[0].id, viewer_id: users[1].id}, {artwork_id: artworks[1].id, viewer_id: users[0].id}])
comments = Comment.create!([{body: "I love butterlies!", commenter_id: users[1].id, artwork_id: artworks[0].id}, {body: "Birds are great!", commenter_id: users[0].id, artwork_id: artworks[1].id}, {body: "Me too!", commenter_id: users[0].id, artwork_id: artworks[0].id}])
likes = artworks[0].likes.create!([{user_id: users[0].id}])