class MoviesController < ApplicationController
    before_action :authentication_required
    before_action :get_movie, only: [:show, :edit, :destroy]

    def index
        @movies = current_user.movies
    end

    def new
        @movie = Movie.new
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

    def destroy
        byebug
    end

    private 

    def get_movie
        @movie = Movie.find(params[:id])
    end
end
