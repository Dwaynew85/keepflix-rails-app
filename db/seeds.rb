# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dwayne = User.create(name: "Dwayne", email: "dwayne@me.com", password: "pw")
joey = User.create(name: "Joey", email: "joey@me.com", password: "pw")
asia = User.create(name: "Asia", email: "asia@me.com", password: "pw")
dorie = User.create(name: "Dorie", email: "dorie@me.com", password: "pw")

dwayne.movies.create_from_link("https://www.imdb.com/title/tt4154796/?ref_=vp_back")
dwayne.movies.create_from_link("https://www.imdb.com/title/tt1825683/?ref_=tt_sims_tt")
dwayne.movies.create_from_link("https://www.imdb.com/title/tt7286456/?ref_=tt_sims_tt")
dwayne.movies.create_from_link("https://www.imdb.com/title/tt0468569/?ref_=tt_sims_tt")

joey.movies.create_from_link("https://www.imdb.com/title/tt8946378/?ref_=tt_sims_tt")
joey.movies.create_from_link("https://www.imdb.com/title/tt1375666/?ref_=tt_sims_tt")
joey.movies.create_from_link("https://www.imdb.com/title/tt0172495/?ref_=tt_sims_tt")

asia.movies.create_from_link("https://www.imdb.com/title/tt0110912/?ref_=tt_sims_tt")
asia.movies.create_from_link("https://www.imdb.com/title/tt0111161/?ref_=tt_sims_tt")

dorie.movies.create_from_link("https://www.imdb.com/title/tt0109830/?ref_=tt_sims_tt")
dorie.movies.create_from_link("https://www.imdb.com/title/tt0120689/?ref_=tt_sims_tt")
dorie.movies.create_from_link("https://www.imdb.com/title/tt0102926/?ref_=tt_sims_tt")

joker = Movie.all[2]
panther = Movie.all[1]
knight = Movie.all[3]

joker.comments.new(user_id: 1, content: "Loved it!")
joker.comments.new(user_id: 2, content: "Awesome!")
joker.comments.new(user_id: 3, content: "Meh")
joker.comments.new(user_id: 4, content: "Disturbing")
joker.save

panther.comments.new(user_id: 1, content: "What we needed")
panther.comments.new(user_id: 2, content: "For the culture")
panther.comments.new(user_id: 3, content: "My favorite!")
panther.comments.new(user_id: 4, content: "Nice!")
panther.save

knight.comments.new(user_id: 1, content: "Best EVER")
knight.comments.new(user_id: 2, content: "Enjoyed it")
knight.comments.new(user_id: 3, content: "Batman is cool!")
knight.comments.new(user_id: 4, content: "I liked it")
knight.save










