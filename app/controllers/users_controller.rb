class UsersController < ApplicationController
    before_action :authentication_required, except: [:new, :create]
    before_action :confirm_user, only: [:edit, :update]

    def index
        
    end

    def new
        if logged_in?
            @user = current_user
            redirect_to root_path
        else
            @user = User.new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path, notice: "#{@user.name} has been created. Please Login"
        else
            render 'users/new', notice: "#{explain_errors(@user)}"
        end
    end

    def edit
        @user = User.find(current_user.id)
    end

    def update 
        @user = User.find(current_user.id)
        @user.update(user_params)
        session[:return_to] ||= request.referer
        
        redirect_to session.delete(:return_to) 
    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:name, :pic_url, :email, :password)
    end
end
