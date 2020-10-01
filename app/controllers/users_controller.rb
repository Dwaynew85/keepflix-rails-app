class UsersController < ApplicationController

    def index
        
    end

    def new
        @user = User.new
    end

    def show
        @user - User.find(params[:id])  
    end

    def create
        @user = User.new #@user = User.create(params[:user])
        #needs to save each field from params
        if @user.save
            redirect_to user_path(@user) 
        else
            render 'users/new'
        end
    end

    def edit

    end

    def destroy

    end
end
