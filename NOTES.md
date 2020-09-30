Movies Model(user id and comment id)
[]belongs to user(users add movies to their personal list)
[]has many comments
[]many to many genres(add at the end)

[]Index: Shows full list of all movies, including picture and comments. #refer to sinatra # sort by genre?
[]New: creates a new movie from IMDB link
[]Show: shows individual movie details, comments, and options to comment

Comment Model
[]belongs to movie
[]belongs to user through movie 

User Model 
[]Must be logged in
[]has many movies 
[]has many comments through movies
[]Edit: edit name, profile pic and password
[]Delete account from edit screen
[]Show: page with user info and comments on movies

Genre Model(add at the end to to set custom movie setter)
[]many to many movies
[]
[]Show: list of all movies under genre 