class UsersController < ApplicationController
    before_action :authentication_required, except: :new
    before_action :check_for_user, only: [:new, :create]

    def index
        
    end

    def new
        if logged_in?
            redirect_to root_path
        else
            @user = User.new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.create(user_params)
        if @user.save
            flash.now[:alert] = "Account Created"
            redirect_to movies_path, notice: "#{@user.name} has been created. Please Login"
        else
            flash.now[:alert] = "Account Denied"
            render 'users/new'
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
