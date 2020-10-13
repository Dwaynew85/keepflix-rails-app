Study:
[x] Many to Many (movies)
[x] Nested Routes (users/movies?)
[x] helper forms?(adding movies/comments)

Movies Model(user id and comment id)
[x]belongs to user(users add movies to their personal list)
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
[X]Show: page with user info 

[]Refactor with Partials(video)

Logins:
[]Facebook
[]Amazon?

ERRORS:
[x] RecordNotFound when loading index with no users.
[x] Default pictures if one isn't added

[] link to user pages on feed page
[] scope method for omniauth?