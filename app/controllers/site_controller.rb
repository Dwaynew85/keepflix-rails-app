class SiteController < ApplicationController
    def index
        @user = User.find(current_user.id)  if current_user
        @movies = Movie.all
        @comment = Comment.new
    end
end
