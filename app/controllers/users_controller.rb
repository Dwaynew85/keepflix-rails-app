class UsersController < ApplicationController

    def index
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new
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
