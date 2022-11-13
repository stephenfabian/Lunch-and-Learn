# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "Will Williamson", email: "will@gmail.com", api_key: 111111111111111)
user2 = User.create(name: "John Johnson", email: "j@gmail.com", api_key: 222222222222222)
user3 = User.create(name: "Ethan Ethanson", email: "e@gmail.com", api_key: 333333333333333)

user1.favorites.create(country: "Italy", recipe_link: "https://www.tastaibela.com", recipe_title: "Macaroni")
user1.favorites.create(country: "Italy", recipe_link: "https://www.tastaibela.com/morefood", recipe_title: "Pasta")
user2.favorites.create(country: "USA", recipe_link: "https://www.tastaibela.com", recipe_title: "Sandwiches")
