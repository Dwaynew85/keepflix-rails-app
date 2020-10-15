class MoviesController < ApplicationController
    before_action :authentication_required
    before_action :get_movie, only: [:show, :edit, :update, :destroy]

    def index
        @movies = current_user.movies
    end

    def new
        @movie = Movie.new
    end

    def trending 
        @user = User.find(current_user.id)  if current_user
        @movies = Movie.trending
        @comment = Comment.new
    end

    def show
    end

    def create
        @movie = Movie.create_from_link(params[:movie][:link])
        @movie.users << current_user
        @movie.save
       
        redirect_to movie_path(@movie)
    end

    def edit 
    end

    def update
        @movie.users << current_user
        session[:return_to] ||= request.referer
        
        redirect_to session.delete(:return_to)
    end

    def destroy
        byebug # delete from particular user's my movies list
    end

    private 

    def get_movie
        @movie = Movie.find(params[:id])
    end
end
