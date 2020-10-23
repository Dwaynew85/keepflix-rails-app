class SiteController < ApplicationController
    def index
        if params 
            @movies = Movie.search(params[:search])
        else
            @movies = Movie.all
        end
        @user = User.find(current_user.id)  if current_user
        @comment = Comment.new
    end
end
