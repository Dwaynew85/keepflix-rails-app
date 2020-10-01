class UsersController < ApplicationController

    def index
        
    end

    def new
        if logged_in?
            redirect_to movies_path #change this
        else
            @user = User.new
        end
    end

    def show
        @user = User.find(params[:id])  
        @movies = Movie.all
    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to movies_path #double check
        else
            render 'users/new'
        end
    end

    def edit

    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
