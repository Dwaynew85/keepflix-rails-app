class UsersController < ApplicationController
    before_action :authentication_required, except: :new

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
        @comment = Comment.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to movies_path, notice: "#{@user.name} has been created. Please Login"
        else
            render 'users/new'
        end
    end

    def edit
        @user = User.find(current_user.id)
    end

    def update 
    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:name, :pic_url, :email, :password)
    end
end
