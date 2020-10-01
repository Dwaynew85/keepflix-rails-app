class MoviesController < ApplicationController
    before_action :authentication_required
    def index
        @movies = Movie.all
    end

    def new
        @movie = Movie.new
    end

    def show 
        @movie = Movie.find(params[:id])
    end

    def create
        @movie = Movie.create_from_link(params[:movie][:link])

        redirect_to movie_path(@movie)
    end

    def edit 
        @movie = Movie.find(params[:id])
    end

    def destroy
        @movie = Movie.find(params[:id])
        byebug
    end
end
