Study:
[] Many to Many (movies)
[x] Nested Routes (users/movies?)
[x] helper forms?(adding movies/comments)

Movies Model(user id and comment id)
[]belongs to user(users add movies to their personal list)
[x]has many comments

[x]Index: Shows full list of all movies, including picture and comments.
[x]New: creates a new movie from IMDB link
[x]Show: shows individual movie details, comments, and options to comment

Comment Model
[x]belongs to movie
[x]belongs to user through movie 

User Model 
[x]Must be logged in
[x]has many movies 
[x]has many comments through movies
[x]Edit: edit name, profile pic and password
[]Delete account from edit screen
[]Show: page with user info and comments on movies

Logins:
[]Facebook
[]Amazon?