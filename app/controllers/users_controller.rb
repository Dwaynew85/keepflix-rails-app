class UsersController < ApplicationController

    def index
        
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])  
        @movies = Movie.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path 
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
