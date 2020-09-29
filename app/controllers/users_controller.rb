class UsersController < ApplicationController

    def index
        
    end

    def new
        @users = User.new
    end

    def create
        @users = User.new
        @user.email = params[:user][:email]
        if @user.save
            redirect_to root_path
        else
            render 'users/new'
        end
    end

    def edit

    end

    def destroy

    end
end
